
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${lang}"/>
<fmt:setBundle basename="localizations.localization" var="loc"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        .movie-details {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 10px 0 5px;
        }

        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical; /* Allow vertical resizing */
        }

        button {
            width: 100%;
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .reviews {
            margin-top: 20px;
        }

        .review {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>

<jsp:include page="common/header.jsp"/>
<body>
<div class="movie-details">
    <h2>${movie.getName()}</h2>
    <p><strong><fmt:message key="movie.author" bundle="${loc}"/>:</strong> ${movie.getAuthor()}</p>
    <p><strong><fmt:message key="movie.description" bundle="${loc}"/>:</strong> ${movie.getDescription()}</p>
    <p><strong><fmt:message key="movie.mark" bundle="${loc}"/>:</strong> ${movie.getAverageMark()}</p>

    <c:if test="${role != 'NOT_AUTH'}">
        <form id="reviewForm" method="post" action="?command=review">
            <label for="marks"><fmt:message key="review.markSection" bundle="${loc}"/>:</label>
            <select id="marks" name="mark" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>

            <label for="reviewText"><fmt:message key="review.reviewForm" bundle="${loc}"/>:</label>
            <textarea id="reviewText" name="review" rows="6" required></textarea>

            <button type="submit">Submit Review</button>
        </form>
    </c:if>

    <div class="reviews">
        <h3><fmt:message key="review.reviewSection" bundle="${loc}"/></h3>
        <c:forEach var="review" items="${movie.getReviewList()}">
            <div class="review">
                <p><strong><fmt:message key="review.user" bundle="${loc}"/>:</strong> ${review.getOwnerName()}(<fmt:message key="user.rating" bundle="${loc}"/>: ${review.getSocialCredit()})</p>
                <p><strong><fmt:message key="movie.mark" bundle="${loc}"/>:</strong> ${review.getMark()}</p>
                <p><strong><fmt:message key="review.review" bundle="${loc}"/>:</strong> ${review.getReview()}</p>
            </div>
        </c:forEach>
    </div>
</div>

</body>

</html>

