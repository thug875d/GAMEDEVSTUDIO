<%--
  Created by IntelliJ IDEA.
  User: Yasser
  Date: 1/17/2022
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>listeoffre botsrap</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style=" background-image: url('https://gamingbolt.com/wp-content/uploads/2020/09/xbox-series-s-image-5.jpg');"    >


<nav class="navbar navbar-light navbar-expand-lg navigation-clean-search   bg-light">

    <div class="container">
        <img
            src = "https://images.frandroid.com/wp-content/uploads/2021/07/android-game-dev-kit-scaled.jpg"
            style="width:150px"/>&nbsp; &nbsp;&nbsp;</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav">
                <li class="nav-item"></li>
                <li class="nav-item"></li>
                <li class="nav-item"><a class="nav-link" href="#"></a></li>
            </ul>
            <form action="rechcercheprofile.jsp" class="me-auto search-form" >
                <div class="d-flex align-items-center"><label class="form-label d-flex mb-0" for="search-field"><i class="fa fa-search"></i></label><input style="width:600px;margin-bottom:-2%;" class="form-control search-field" type="search" id="search-field" placeholder="rechercher les profils selon la fonction " name="search"></div>
                <div ><button style="margin-left:650px;margin-top: -5.50%;" class="btn btn-warning action-button" type="submit" role="button" href="#">rechercher</button></div>
            </form>

            <a style="margin-left: 10px;" class="btn btn-success action-button" role="button" href="postulation.jsp">consulter les postulations</a>
            <a style="margin-left: 10px;" href="deconnexion.jsp"  class="btn btn-danger">Deconnexion</a>
        </div>
    </div>
</nav>




<div class="container px-3 mt-4" style="display: flex">
    <div class="row gx-4 row-cols-2">

<%

    String driver = "com.mysql.jdbc.Driver";
    String con = "jdbc:mysql://localhost:3306/gamedevstudio";
    String req = "select * from user  where rectouconcept='Un concepteur de jeux' order by nbracc desc ";

    String img = null;
    Blob image = null;
    byte[] imgData = null;
    float note;

    try {
        // étape 1: charger la classe de driver
        Class.forName(driver);

        // étape 2: créer l'objet de connexion
        Connection conn = DriverManager.getConnection(con, "root", "");

        // étape 3: créer l'objet statement

        PreparedStatement stmt = conn.prepareStatement(req);

        ResultSet res = stmt.executeQuery();
        // étape 4: exécuter la requête
        if (res.next()) {
            do {

                System.out.println("La connexion a était bien établit!!");
                String email=res.getString(5);

                String username = res.getString(4);
                String Description = res.getString(9);
                String fct = res.getString(8);
                note = res.getFloat(11);
                image = res.getBlob(10);
                imgData = image.getBytes(1, (int) image.length());
                String encodedImage = Base64.getEncoder().encodeToString(imgData);
                img = "data:image/jpg;base64," + encodedImage;
                out.print(
                        "<center> <div class='m-4 '> <div class='card' style='width: 500px; border-color: black !important'> <div class='row g-0'> <div class='col-sm-5' style='border-radius: 50% !important; width: 35%'> <img src="+img+" class='card-img-top h-100' alt='...'> </div> <div class='col-sm-7'> <div class='card-body'>");

                out.print("<h4 class='card-title'>" + username + "</h4>"
                        + "<p class='card-text'><b style='color:blue'>Description :</b> " + Description
                        + "<br> <b style='color:red'>Fonction: </b>" + fct + "</p>" + "<b style='color:orange'>email: </b> "+email+ "</p>"
                        +"<b style='color:green'>note: </b> "+note+ "</p>"+ "</td></tr></div> </div> </div> </center>");




            } while (res.next());

        } else {
        }
        // étape 5: fermez l'objet de connexion
        conn.close();
    } catch (Exception e) {
        System.out.println(e);
    }
%>

</div>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>