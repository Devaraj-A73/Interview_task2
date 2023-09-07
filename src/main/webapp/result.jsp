<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Table Result</title>
</head>
<body>
    <% 
    String columnCountStr = request.getParameter("txtColumnCount");

    if (columnCountStr != null && !columnCountStr.isEmpty()) {
        try {
            int columnCount = Integer.parseInt(columnCountStr);

            // Generate the table dynamically based on the input value
            out.println("<table border=\"1\">");

            // Create a header row
            out.println("<tr>");
            for (int i = 0; i <= columnCount; i++) {
                String rowValue = (i == 0) ? "Empty" : Integer.toString(i);
                out.println("<th>" + rowValue + "</th>");
            }
            out.println("<th>Sum</th>");
            out.println("<th>Avg</th>");
            out.println("</tr>");

            // Create the table rows
            for (int i = 1; i <= columnCount; i++) {
                int sumValue = 0;
                float avgValue = 0;
                out.println("<tr>");
                for (int j = 0; j <= columnCount; j++) {
                    int cellValue = (j == 0) ? i : (i * j);
                    sumValue = (j != 0) ? (cellValue + sumValue) : sumValue;
                    out.println("<td>" + cellValue + "</td>");
                }
                avgValue = (float) sumValue / (float) columnCount;
                out.println("<td>" + sumValue + "</td>");
                out.println("<td>" + avgValue + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        } catch (NumberFormatException e) {
            // Handle invalid input (non-integer)
            out.println("Please enter a valid number of columns.");
        }
    } else {
        // Handle empty input
        out.println("Please enter a valid number of columns.");
    }
    %>
</body>
</html>
