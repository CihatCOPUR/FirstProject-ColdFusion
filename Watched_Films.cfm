<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="http://127.0.0.1:8500/training/Project/style.css">
        
        
         <style type='text/css'>

        
   
        

      .filmdiv1 {
         
            border: 1px solid #6b7272;         
            background-color: #E8E8E8;
            padding: 1rem;
            width:100%;
           

      }
      .filmdiv2 {
        border:2px solid black;
        border-radius:7px;
        display:flex;
        height:350px;
        padding:25px;
        margin-top:1rem;
      }
      .ActorNameDiv{
  display:flex;
}
      .ActorNameDiv  p{
        margin-right:10%
      }
      
     .FilmDesc{
      margin-right:10px;
     }
  
    .filmimg{
      border:5px solid black;
      border-radius:5px;
     width:250px;
      height:300px;
      
    }
    .footer_container1 {
  width: 100%;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  flex-wrap: wrap-reverse;
  border-top: 4px solid darkblue;
  border-bottom: 4px solid darkblue;
  box-shadow:inset 2px 0px 10px 0px 
  rgb(28, 28, 229);
  font-size: 0.7rem;
  font-weight: 700;
}
.footer_container1 a {
  color: black;
  margin-left: 1rem;
}

.footer_container1 a{
  margin-left: 2rem;
}


      </style>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <title>I and my first project</title>
</head>
<body> 
<center class='head'>
    <h1>First  Project</h1>
</center>



<cfdiv class='navbar'> 


    
    <h1><a href='index.cfm'  style="text-decoration: none">Home</a> </h1>
    <h1><a href='Watched_Films.cfm'  style="text-decoration: none">Watched Films</a></h1>
    <h1><a href='Actors.cfm'  style="text-decoration: none">Actors</a></h1>
    <h1><a href='Albums.cfm'  style="text-decoration: none">Albums</a></h1>
    <h1><a href='Books.cfm'  style="text-decoration: none">Books</a></h1>
 
</cfdiv>

<cfquery name = "FILMS" datasource = "WorkCubeDB">
  SELECT
    *
  FROM
    FILMS
</cfquery>

<div class='filmdiv1'>

<cfoutput query='FILMS'>

<div class='filmdiv2'>
  
  <div>
    <h5 class="">#FILM_NAME#   ,    #FILM_YEAR#</h5>

<cfquery name = "ACTORS" datasource = "WorkCubeDB">
  SELECT ACTOR_NAME FROM ACTORS ,FILMS_ACTORS_REL , FILMS
WHERE ACTORS.ACTOR_ID=FILMS_ACTORS_REL.ACTOR_ID AND FILMS.FILM_ID=#FILMS.FILM_ID#   AND FILMS_ACTORS_REL.FILM_ID=#FILMS.FILM_ID#
     
</cfquery>
<p>Oyuncular:</p>
<div class='ActorNameDiv'>
<cfloop query = "#ACTORS#" >
  

  <p>#ACTORS.ACTOR_NAME#</p>
   </cfloop> 
  </div>  
 
  <p class="FilmDesc">   Konu; #FILM_DESC#</p>
  </div>
  <div>
    <img class="filmimg" src="#FILM_IMG#" alt="Card image cap">
 
</div>

 </div >
</cfoutput>
  
</div>



<cfdiv class='footer_container1'>
         <marquee >
          <p>Cihat    © 2020 All Rights Reserved.</p>
        </marquee>
         <cfoutput>#dateFormat(now(), 'long')#</cfoutput>
          <p>  Workcube     Coder  </p>
      <p><a href='https://www.linkedin.com/in/cihat-%C3%A7opur-ba13a924a/' target="_blank">
      <svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
  <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
</svg></a><a href='https://github.com/CihatCOPUR/FirstProject-ColdFusion' target="_blank">
<svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
  <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
</svg></a>
</p>
</cfdiv>




</body>
</html>