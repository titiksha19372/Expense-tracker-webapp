<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="../index.jsp"><i
			class="fa-solid fa-money-check"></i> Expense Tracker</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${not empty loginUser}">
						<li class="nav-item"><a class="nav-link active"
							href="../user/home.jsp" tabindex="-1"> <i
								class="fa-solid fa-house"></i> Home
						</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="../user/add_expense.jsp"> <i
								class="fa-solid fa-cash-register"></i> Add Expense
						</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="../user/view_expense.jsp" tabindex="-1"> <i
								class="fa-solid fa-rectangle-list"></i> View Expense
						</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="../user/download.jsp" tabindex="-1"> <i
								class="fa-solid fa-file-export"></i> Download
						</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="../user/expense splitter.jsp" tabindex="-1"> <i
								class="fa-solid fa-money-bill-transfer"></i> Expenses spliting
						</a></li>
					</c:when>
					<c:otherwise>
						<!-- Navigation links for non-logged-in users -->
						<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link active"
								href="index.jsp"> <i class="fa-solid fa-house"></i> Home
							</a></li>
							<li class="nav-item"><a class="nav-link active"
								href="login.jsp"> <i class="fa-solid fa-sign-in"></i> Login
							</a></li>
							<li class="nav-item"><a class="nav-link active"
								href="regsister.jsp"> <i class="fa-solid fa-user-plus"></i>
									Register
							</a></li>
						</ul>

					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${not empty loginUser}">
						<!-- Navigation links for logged-in users -->
						<li class="nav-item"><a class="nav-link active" href="#">
								<i class="fa-regular fa-id-badge"></i> ${loginUser.fullname}
						</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="../Logout"> <i class="fa-solid fa-sign-out"></i> Logout
						</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>

<style>
.white-home {
	color: white;
}
</style>
