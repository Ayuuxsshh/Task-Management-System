<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${task != null ? 'Edit' : 'Add'} Task</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            max-width: 500px;
            width: 100%;
        }
        h2 { margin-bottom: 20px; color: #333; }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: 500;
        }
        input, textarea, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        textarea { resize: vertical; min-height: 100px; }
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn-primary { background: #667eea; color: white; }
        .btn-secondary { background: #6c757d; color: white; }
        .btn:hover { opacity: 0.9; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>${task != null ? 'Edit' : 'Add New'} Task</h2>
        <form method="post" action="tasks">
            <input type="hidden" name="action" value="${task != null ? 'update' : 'save'}">
            <c:if test="${task != null}">
                <input type="hidden" name="id" value="${task.id}">
            </c:if>
            
            <div class="form-group">
                <label>Title:</label>
                <input type="text" name="title" value="${task.title}" required>
            </div>
            
            <div class="form-group">
                <label>Description:</label>
                <textarea name="description" required>${task.description}</textarea>
            </div>
            
            <div class="form-group">
                <label>Priority:</label>
                <select name="priority" required>
                    <option value="Low" ${task.priority == 'Low' ? 'selected' : ''}>Low</option>
                    <option value="Medium" ${task.priority == 'Medium' ? 'selected' : ''}>Medium</option>
                    <option value="High" ${task.priority == 'High' ? 'selected' : ''}>High</option>
                </select>
            </div>
            
            <c:if test="${task != null}">
                <div class="form-group">
                    <label>Status:</label>
                    <select name="status" required>
                        <option value="Pending" ${task.status == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Completed" ${task.status == 'Completed' ? 'selected' : ''}>Completed</option>
                    </select>
                </div>
            </c:if>
            
            <button type="submit" class="btn btn-primary">Save Task</button>
            <a href="tasks" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>