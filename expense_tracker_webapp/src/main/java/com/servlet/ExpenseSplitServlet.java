package com.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ExpenseSplitServlet")
public class ExpenseSplitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Parse request parameters
            double totalExpense = Double.parseDouble(request.getParameter("totalExpense"));
            int numParticipants = Integer.parseInt(request.getParameter("numParticipants"));

            // Calculate individual share
            Map<String, Double> participantShares = calculateParticipantShares(totalExpense, numParticipants);

            // Forward the result to the JSP page
            request.setAttribute("participantShares", participantShares);
            request.getRequestDispatcher("../user/expense Splitter.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Handle parsing errors
            request.setAttribute("errorMsg", "Invalid input. Please enter valid numbers.");
            request.getRequestDispatcher("../user/expense Splitter.jsp").forward(request, response);
        }
    }

    private Map<String, Double> calculateParticipantShares(double totalExpense, int numParticipants) {
        double individualShare = totalExpense / numParticipants;
        Map<String, Double> participantShares = new HashMap<>();
        for (int i = 1; i <= numParticipants; i++) {
            String participant = "Participant " + i;
            participantShares.put(participant, individualShare);
        }
        return participantShares;
    }
}
