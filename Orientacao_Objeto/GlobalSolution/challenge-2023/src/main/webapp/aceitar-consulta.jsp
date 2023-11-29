<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/aceitar-consulta.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <title>Menu Medico</title>
</head>
<body>

    <div class="overlay-fundo" id="overlayFundo"></div>

    <div class="menu-container">
        <div class="menu-title">
            <h2>Menu - Medico</h2>
        </div>
        <div class="menu-item" onclick="location.href='appointment?action=listExams'">
            <h2>Aceitar Consulta</h2>
        </div>
        <div class="menu-item" onclick="location.href='menu-medico.jsp'">
            <h2>Agendar Maquinas</h2>
        </div>
        <div class="menu-item" onclick="location.href='appointment?action=listAppointments'">
            <h2>Gerenciar Paciente</h2>
        </div>
        <div class="menu-item" onclick="location.href='tech'">
            <h2>Tecnologias</h2>
        </div>
        <div class="menu-item1">
            <button class="logout-button" onclick="location.href='logout'">Sair</button>
        </div>
    </div>
    </div>

    
        <div class="aba" id="abaAceitarConsulta">
            <div class="conteudo-tabela">
                <h2>Aceitar Consulta</h2>
                <table id="tabela">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Consulta</th>
                            <th>Pendencia</th>
                            <th>Exame</th>
                            <th>Visualizar dados</th>
                            <th>Acao</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${exams}" var="e">
                            <tr>
                                <td>${e.id}</td>
                                <td>${e.type.name}</td>
                                <td>${e.pendency.getDetails()}</td>
                                <td>${e.id}</td>
                                <td><button onclick="obterIdExame(${e.id})">Registrar dados do exame</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    <footer class="footer">
        <p>Plano de Saude LUCVIC &copy; 2023</p>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var tabela = document.getElementById('tabela');

            var linhas = tabela.querySelectorAll('tbody tr');

            linhas.forEach(function(linha) {
                var cell = document.createElement('td');
                cell.classList.add('acao-cell'); 
                var button = document.createElement('button');
                button.textContent = 'Aceitar';
                button.addEventListener('click', function() {
                    var consulta = linha.cells[0].textContent;
                    fetch("http://localhost:8080/test/appointment?action=acceptAppointment", {
                        method: "POST",
                        body: consulta
                    })
                });
                cell.appendChild(button);
                linha.appendChild(cell);
            });
        });

        function obterIdExame(id) {
            window.location.href = 'bio-data?id=' + id;
        }
    </script>
    
</body>
</html>