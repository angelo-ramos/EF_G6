<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="funcion" scope="request" type="com.example.ef_g6.Beans.Cartelera"/>
<html>
<head>
    <title>TeleFunciones</title>
    <!--<link rel="shortcut icon" href="/" type="image/x-icon">-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="estilosPrincipal.css" rel="stylesheet" type="text/css">
    <style>
        nav {
            background: blue;
        }
        nav{
            height: 80px;
            width: 100%;
        }
        .lista {
            background-color: white;
            margin-top: 50px;
            padding-left: 20px;
            padding-right: 20px;
        }
    </style>
</head>
<body>
<nav>
    <input type="checkbox" id="check">
    <label for="check"  class="checkbtn">
        <i class="fa fa-bars"></i>
    </label>
    <label class="logo"><span>Telefunciones</span></label>
    <ul>
        <label class="nombre"><span>Angelo Ramos</span></label>
        <label class="status"><span>Rol: Vendedor</span></label>
        <li><a href="<%=request.getContextPath()%>/?action=logout">Cerrar Sesión</a></li>
    </ul>
</nav>
<section>
    <div class='container lista' style="padding-top:10px; padding-bottom: 10px">
        <h1 class='mb-3'>Editar funcion</h1>

        <a href="<%=request.getContextPath()%>/CarteleraServlet?a=listar" class="btn btn-primary mb-4">Regresar</a>

        <div class='container'>
            <h1 class='mb-3'>Editar trabajo</h1>
            <form method="POST" action="<%=request.getContextPath()%>/EditarServlet?a=actualizar">
                <input type="hidden" name="Id" value="<%=funcion.getIdCartelera()%>" />
                <div class="mb-3">
                    <label for="pelicula" class="form-label">Pelicula</label>
                    <input type="text" class="form-control" name="pelicula" id="pelicula" value="<%=funcion.getPelicula().getNombre()%>">
                </div>
                <div class="mb-3">
                    <label for="cine" class="form-label">Cine</label>
                    <input type="text" class="form-control" name="cine" id="cine" value="<%=funcion.getCine().getIdCine()%>">
                </div>
                <div class="mb-3">
                    <label for="horario" class="form-label">Horario</label>
                    <input type="text" class="form-control" name="horario" id="horario" value="<%=funcion.getHorario()%>">
                </div>
                <a href="<%=request.getContextPath()%>/CarteleraServlet" class="btn btn-danger">Regresar</a>
                <button type="submit" class="btn btn-primary">Actualizar</button>
            </form>
        </div>


    </div>
</section>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
