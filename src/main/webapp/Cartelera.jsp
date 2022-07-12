<%@ page import="java.time.ZonedDateTime" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- Importando estilos personalizados -->
    <link rel="stylesheet" type="text/css" href="Assets/estilos_d.css">
    <title>Menu Principal</title>
</head>



<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-tggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/ViajeServlet">Cartelera de cine</a>
            <form class="d-flex">
                <a class="nav-link active" aria-current="page" href="#">Nombre usuario</a>
                <button class="btn btn-outline-success" type="submit">Cerrar Sesion</button>
            </form>
        </div>
    </div>
</nav>
<br>
</br>

<div class="container">
    <!-------------------------->
    <div class="card">
        </br>
        <div class="d-flex">
            <div class="p-2 flex-grow-1 bd-highlight"><h1> Cartelera:</h1></div>
            <div class="p-2 bd-highlight">
                <form method="post" action="<%=request.getContextPath()%>/ViajeServlet?a=buscar" >
                    <div class="input-group mb-3">
                        <input class="form-control me-2" type="search" placeholder="Buscar por ciudad" aria-label="Search" aria-describedby="button-addon2" name="textoABuscar">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg></button>
                    </div></form></div>
            <div class="p-2 bd-highlight"><button class="btn btn-outline-success" type="button" data-bs-toggle="modal" data-bs-target="#ModalCrear">Crear viaje</button></div>
        </div>
        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Id viaje</th>
                    <th scope="col">Fecha reserva</th>
                    <th scope="col">Fecha vuelo</th>
                    <th scope="col">Origen</th>
                    <th scope="col">Destino</th>
                    <th scope="col">Seguro</th>
                    <th scope="col">N° Boletos</th>
                    <th scope="col">Costo</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- Modal CREAR -->
<div class="modal fade" id="ModalCrear" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Crear viaje</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form class="needs-validation" method="POST" action="<%=request.getContextPath()%>/ViajeServlet?a=crear" >
                <div class="modal-body">
                    <b>Complete el formulario para agregar un viaje</b>
                    </br>
                    </br>
                    <div class="input-group mb-3">
                        <label for="date">Fecha de vuelo:  </label>
                        <input type="date" id="date" name="fecha" required min=<%=LocalDate.now()%>>
                    </div>

                    <div class="input-group mb-3">
                        <label for="date">Ciudad origen:  </label>
                        <input type="text" class="form-control" placeholder="Ciudad Origen" aria-label="Username" aria-describedby="basic-addon1" name="origen" required>
                    </div>

                    <div class="input-group mb-3">
                        <label for="date">Ciudad destino:  </label>
                        <input type="text" class="form-control" placeholder="Ciudad Destino" aria-label="Recipient's username" aria-describedby="basic-addon2" name="destino" required>
                    </div>

                    <div class="input-group mb-3">
                        <label for="date">Empresa de seguro:  </label>
                        <select class="form-select" aria-label="Default select example" name="seguro" required>
                            <option selected>-------</option>
                            <option value="1">Rimac</option>
                            <option value="2">Pacifico</option>
                            <option value="3">La positiva</option>
                            <option value="4">Seguro internacional</option>
                            <option value="5">Otro</option>
                        </select>
                    </div>

                    <div class="row justify-content-center">
                        <div class="col-4">
                            <label for="date">N° boletos:</label>
                            <div class="input-group mb-3">
                                <input type="number" class="form-control" aria-label="Amount (to the nearest dollar)" min="0" name="boletos" required>
                            </div>
                        </div>
                        <div class="col-4">
                            <label for="date">Costo:</label>
                            <div class="input-group mb-3">
                                <span class="input-group-text">$</span>
                                <input type="number" class="form-control"  min="0.00" name="costo" step="0.1" required>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">cancelar</button>
                    <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Crear</button>
                </div>
            </form>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

<script>
    var forms = document.querySelectorAll('.needs-validation');

    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');
        }, false);
    });

</script>

</body>

</html>
