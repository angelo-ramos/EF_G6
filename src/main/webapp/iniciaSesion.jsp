<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Iniciar sesion</title>
        <link rel="stylesheet" href="signup.css"/>
        <!-- referenciando bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <style>
            .text-center {
                text-align: center;
            }
            .etiUser {
                color: #ffffff;
            }
            .etiUser2{
                color: #b40505;
            }
        </style>
    </head>
    <body background="fondo.jpg">
        <!-- Login-->
        <form id="signup" method="POST" action="<%=request.getContextPath()%>/">
            <div class="text-center">
                <img src="logo2.png" width="200"/></a>
            </div>
            <br/>
            <div class="card-header">
                <div class="text-center">
                    <h3 class="etiUser">Bienvenido</h3>
                </div>
            </div>
            <input type="number" name="dni" placeholder="Usuario" required="">
            <input type="password" name="pass" placeholder="Contraseña" required="">

            <%if(session.getAttribute("msg") != null){%>
            <div>
                <div class="text-danger mb-2"><%=session.getAttribute("msg")%></div>
            </div>
            <%session.removeAttribute("msg");%>
            <%}%>

            </br>
            </br>

            <div class="text-center">
                <input type="submit" class="btn btn-outline-primary" value="Ingresar"/>
            </div>
        </form>

    </body>
</html>