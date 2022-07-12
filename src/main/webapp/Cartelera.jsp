
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <h1 class='mb-3'>Lista de Funciones</h1>

  <a href="<%=request.getContextPath()%>/PrincipalServlet?a=crear" class="btn btn-primary mb-4">Agregar nueva funcion</a>

  <table class="table">
    <thead>
      <tr>
        <th>Cadena</th>
        <th>Cine</th>
        <th>Película</th>
        <th>Horario</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Cineplanet</td>
        <td>Cine</td>
        <td>Pelicula</td>
        <td>Horario</td>
        <td><a class="btn btn-primary" href="<%=request.getContextPath()%>/PrincipalServlet?a=editar&id=">Editar</a></td>
        <td><button type="button" data-bs-toggle="modal" data-bs-target="#Modal" class="btn btn-danger">Borrar</button></td>
      </tr>
    </tbody>

  </table>
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
