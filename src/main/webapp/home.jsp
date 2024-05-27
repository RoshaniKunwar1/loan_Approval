<%@page
	import=" java.util.List, Com.DB.DBConnect, Com.User.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap');
*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}


.btn1{
    background-color: white;
    color: black;
    border-radius: 0px  20px 20px 0px;
    transition: all 0.4s;
}

.btn1:hover{
    background-color: rgb(254, 253, 255);
}

.bi-person{
    font-size: 25px;
    color: black;
    cursor: pointer;
    padding-top: 5px;
    transition: all 0.4s;
}

.bi-person:hover{
    color:rgb(197,12,99);
}

.bi-journal-check{
    font-size:25px;
    color:black;
    cursor: pointer;
    padding-top:5px;
    transition: all 0.4s;
}

.bi-journal-check:hover{
    color: rgb(197, 12, 99);
}

.bi-box-arrow-in-right{
    font-size:25px;
    color:white;
    cursor: pointer;
    padding-top:5px;
    transition: all 0.4s;
}

.bi-box-arrow-in-right:hover{
    color: rgb(197, 12, 99);
}


.main p{
    font-size:18px;
    font-weight: 700px;
}

.mbtn1{
    height:50px;
    width:25%;
    outline:none;
    border: none;
    padding: 5px;
    margin:auto;
    color:white;
    background:rgb(197, 12, 99);
    border-radius: 50px;
    transition: all 0.4s; 
}

.mbtn1:hover{
    background-color:antiquewhite;
    color:black;
    border:1px solid black;    
}

.mbtn2{
    height:50px;
    width:25%;
    outline:none;
    border: none;
    padding: 5px;
    margin:auto;
    color:white;
    background:rgb(197, 12, 99);
    border-radius: 50px;
    transition: all 0.4s;
}

.mbtn2:hover{
    background-color:antiquewhite;
    color:black;
    border:1px solid black;    
}

.mbtn3{
    height:50px;
    width:45%;
    outline:none;
    border: none;
    padding: 5px;
    margin:auto;
    color:white;
    background:rgb(197, 12, 99);
    border-radius: 50px;
    transition: all 0.4s;
}

.mbtn3:hover{
    background-color:antiquewhite;
    color:black;
    border:1px solid black;    
}

.mbtn4{
    height:50px;
    width:100%;
    outline:none;
    border: none;
    padding: 5px;
    margin:auto;
    color:white;
    background:rgb(197, 12, 99);
    border-radius: 50px;
    transition: all 0.4s;
}

.mbtn4:hover{
    background-color:blue;
    color:black;
    border:1px solid black;    
}

.features .card{
    margin-right: 10px;
    outline: black;
}

.features .card :hover{
    background: antiquewhite;
}

.cards-wrapper{
    display: flex;
}

.products .card{
    margin-right: 2px;
    outline: black;
    border: 1px solid black;
    width:calc(100%/3);
}

.image-wrapper{
    height: 22vw;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: center;
}

.image-wrapper img{
    max-width:100%;
    max-height:100%;
}

.reviews{
    background-size: cover;
}

.img-area img{
    height: 300px;
    width:300px;
    border-radius:50%;
    border: 2px solid rgb(197, 12, 99);
    margin-left: 150px;
    

}

.contact{
    background: #145290;
    background-size: cover;
    width:100%;
}

span{
    background: rgb(197, 12, 99);
    color: rgb(254, 253, 255);
    clip-path: polygon(100% 0%,93% 50%,100% 99%,0% 100%,7% 50%,0% 0%);
}

.contact .container .row a{
    color: #FFFFFF;
    padding: .5rem;
    height:4rem;
    width:4rem;
    border: 0px solid black;
    border-radius: .5rem;
    font-size: 1rem;
    margin-left: .2rem;
}

.contact .container .row a:hover{
    color:rgb(197, 12, 99);
    padding: .5rem;
    background: white;
}

.contact .container .row p:hover{
    color:      ;
    padding: .5rem;

}

.contact .container .row h3:hover{
    color:rgb(197, 12, 99);
    padding: .5rem;

}

.contact p:hover{
    color:rgb(197, 12, 99);
}

.cat_container{
    background: antiquewhite;
    background-size: cover;
    width:100%;
}

.input-group{
    outline:black;
    border: black;
    color:white;
    background:rgb(197, 12, 99);
    transition: all 0.4s;
}

.input-group:hover{
    background-color:rgb(213, 174, 202);
    color:black;
    border:1px solid black;    
}

.inserting{
    background: antiquewhite;
    background-size: cover;
}
      body{
        overflow-x:hidden;
      }
    </style>
</head>
<title>Home page</title>
</head>
<body>
	<%@ include file="allComponent/allCSS.jsp" %>
  	<%@ include file="allComponent/navbar.jsp" %>
  	
<section class="main py-3" id="home">
    <div class="container">
      <div class="row py-5">
        <div class="col-lg-6 col-md-6 col-sm-12 py-5">
          <h1 class="px-5">POKHARA ROYAL SAVING & CREDIT COOPERATIVE SOCIETY LTD</h1>
          <div class="line my-4">
            <p>We provide various services regarding loans...
            In cooperation with various consumer shops, discount cards are being provided
             to its members to save them from the rising inflation.</p>
          </div>
          <div class="text-center">
          <button class="mbtn1 mt-4 bg-success">Read More</button>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12">
          <div class="main1 text-center"><img src="image/1pkr.jpg" width="500px" height="450px"></div>
        </div>
      </div>
    </div>
</section>

  <footer class="contact text-white">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-12 col-sm-12 pt-5">
          <div class="social-media">
            <h3>Pokhara Royal</h3>
            <p style="line-height: 1.8;">Feel Free to follow us on our social media handlers.All the links are given
              below.</p>
            <div class="socio text-center">
              <a href="https://www.facebook.com/hi5treasures" class="fa-brands fa-facebook h-50"></a>
              <a href="https://wa.me/9846907548" class="fa-brands fa-whatsapp h-50"></a>
            </div>
          </div>
        </div>

        <div class="Contact-info col-lg-4 col-md-12 col-sm-12 pt-5">
          <h3>Contact-Info</h3>
          <p></h1><i class="bi bi-telephone-fill"></i> +977-61-588833, 587833</p>
          <p><i class="bi bi-envelope-fill"></i>info@royalcooperative.com</p>
          <p><a href="https://maps.app.goo.gl/cNWmePTnTeuHWLpg9"><i class="bi bi-geo-alt-fill"></i> Buddha Chowk, Kaski</a></p>

        </div>
        <div class="quick-links col-lg-4 col-md-12 col-sm-12 py-5">
          <img src="image/map.jpg" alt="" height="200px">
         </div>
      </div>
    </div>
    </div>
  </footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
</body>
</html>

	<%@ include file="allComponent/footer.jsp" %>
</body>
</html>