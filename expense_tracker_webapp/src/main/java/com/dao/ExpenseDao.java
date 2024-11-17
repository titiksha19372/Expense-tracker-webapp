package com.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.function.Function;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Expression;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Expense;
import com.entity.User;

public class ExpenseDao {
    private SessionFactory factory = null;
    private Session session = null;

    public ExpenseDao(SessionFactory factory) {
        super();
        this.factory = factory;
    }

    private <T> T executeInTransaction(Function<Session, T> operation) {
        Transaction transaction = null;
        T result = null;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            result = operation.apply(session);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    public boolean saveExpense(Expense expense) {
        return executeInTransaction(session -> {
            session.save(expense);
            return true;
        });
    }

    public Expense getExpenseById(int id) {
        return executeInTransaction(session -> {
            Query<Expense> query = session.createQuery("FROM Expense WHERE id = :id", Expense.class);
            query.setParameter("id", id);
            return query.uniqueResult();
        });
    }

    public List<Expense> getAllExpensesByUser(User user) {
        return executeInTransaction(session -> {
            Query<Expense> query = session.createQuery("FROM Expense WHERE user = :user", Expense.class);
            query.setParameter("user", user);
            return query.getResultList();
        });
    }

    public List<Expense> getAllExpensesByUserSortedByDate(User user, String sortOrder) {
        return executeInTransaction(session -> {
            String queryString = "FROM Expense WHERE user = :user ORDER BY date " + sortOrder;
            Query<Expense> query = session.createQuery(queryString, Expense.class);
            query.setParameter("user", user);
            return query.getResultList();
        });
    }

    public boolean updateExpense(Expense expense) {
        return executeInTransaction(session -> {
            session.update(expense);
            return true;
        });
    }

    public boolean deleteExpense(int id) {
        Expense expense = getExpenseById(id);
        return expense != null && executeInTransaction(session -> {
            session.delete(expense);
            return true;
        });
    }

    public List<Expense> getAllExpensesByUser1(User user) {
        return executeInTransaction(session -> {
            Query<Expense> query = session.createQuery("FROM Expense WHERE user = :user", Expense.class);
            query.setParameter("user", user);
            return query.getResultList();
        });
    }

    public double getTodayExpensesTotal(User user) {
        return executeInTransaction(session -> {
            LocalDateTime todayStart = LocalDateTime.of(LocalDate.now(), LocalTime.MIN);
            LocalDateTime todayEnd = LocalDateTime.of(LocalDate.now(), LocalTime.MAX);
            String hql = "SELECT SUM(price) FROM Expense WHERE user = :user AND date BETWEEN :todayStart AND :todayEnd";
            Query<Double> query = session.createQuery(hql, Double.class);
            query.setParameter("user", user);
            query.setParameter("todayStart", todayStart);
            query.setParameter("todayEnd", todayEnd);
            return query.getSingleResult() != null ? query.getSingleResult() : 0.0;
        });
    }

    public double getYesterdayTotalExpense(User user) {
        return executeInTransaction(session -> {
            LocalDateTime yesterdayStart = LocalDateTime.of(LocalDate.now().minusDays(1), LocalTime.MIN);
            LocalDateTime yesterdayEnd = LocalDateTime.of(LocalDate.now().minusDays(1), LocalTime.MAX);
            String hql = "SELECT SUM(price) FROM Expense WHERE user = :user AND date BETWEEN :yesterdayStart AND :yesterdayEnd";
            Query<Double> query = session.createQuery(hql, Double.class);
            query.setParameter("user", user);
            query.setParameter("yesterdayStart", yesterdayStart);
            query.setParameter("yesterdayEnd", yesterdayEnd);
            return query.getSingleResult() != null ? query.getSingleResult() : 0.0;
        });
    }

    public double getMonthlyExpenses(User user) {
        return executeInTransaction(session -> {
            LocalDate firstDayOfMonth = LocalDate.now().withDayOfMonth(1);
            LocalDateTime monthStart = LocalDateTime.of(firstDayOfMonth, LocalTime.MIN);
            LocalDateTime monthEnd = LocalDateTime.of(firstDayOfMonth.plusMonths(1), LocalTime.MAX);
            String hql = "SELECT SUM(price) FROM Expense WHERE user = :user AND date BETWEEN :monthStart AND :monthEnd";
            Query<Double> query = session.createQuery(hql, Double.class);
            query.setParameter("user", user);
            query.setParameter("monthStart", monthStart);
            query.setParameter("monthEnd", monthEnd);
            return query.getSingleResult() != null ? query.getSingleResult() : 0.0;
        });
    }

    public double getTotalExpenses(User user) {
        return executeInTransaction(session -> {
            String hql = "SELECT SUM(price) FROM Expense WHERE user = :user";
            Query<Double> query = session.createQuery(hql, Double.class);
            query.setParameter("user", user);
            return query.getSingleResult() != null ? query.getSingleResult() : 0.0;
        });
    }
    public List<Expense> getExpensesByDateRange(User user, LocalDate startDate, LocalDate endDate) {
        return executeInTransaction(session -> {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Expense> query = builder.createQuery(Expense.class);
            Root<Expense> root = query.from(Expense.class);

            query.select(root)
                 .where(builder.and(
                    builder.equal(root.get("user"), user),
                    builder.between(root.get("date"), startDate, endDate)
                 ));

            return session.createQuery(query).getResultList();
        });
    }


}
