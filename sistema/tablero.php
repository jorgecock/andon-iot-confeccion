<?php
	session_start();
	//if($_SESSION['rol']!=1){
	//	header("location: ./");
	$estadopagina=3; //contando

	include "scripts.php";
	include "functions.php";
	include "definicionmodulo.php";
	include "includes/scripts.php";

	include "validacionestadoactualTablero.php";

	include "../conexion.php";
	$query2 =mysqli_query($conexion,"
				SELECT u.*, r.numeroordenproduccion , s.nombre 
				FROM modulos u 
				INNER JOIN ordenesproduccion r ON u.ordendeprod=r.idordenproduccion
				INNER JOIN producto s ON  u.itemaproducir=s.idproducto
				WHERE u.idmodulo=$mod");
	mysqli_close($conexion);
	$data=mysqli_fetch_array($query2);

	//$mod=1;
	$nh=9; //numero de horas
	$ref=2365089; //Referencia hipotetica
	$sam=3; //Sam hipoteticos
	$totalunidades=2800; 
	$nper=3;
	$meta=(60/$sam)*$nper;
	$unidProd = [26,7,10,7,9,9,8,8,0];
	$horastrans = count($unidProd);
	echo ($horastrans);
?>

<style type="text/css"> 
	table, th, td { 
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center; 
	}
	.red {
		background-color: #F74B4B;
	}
	.gris {
		background-color: #686866;
	}
</style>


<!DOCTYPE html>
<html lang="es">
<head>
	<title>Tablero</title>
</head>
<body style="background-color: #000000" onload="mueveReloj()">
	

	<form name="form_reloj">
		<input type="text" name="reloj" style="font-size : 14pt; text-align : left;" onfocus="window.document.form_reloj.reloj.blur()">
	</form>
	<h3 align='left' style="background: white;"> Fecha: <?php echo date("d/m/Y"); ?></h3>
	<div style="background: white">
	<?php 
	  	//letrero nombre módulo
	  	include "letreroNombreModulo.php"; 
	 ?>
	</div>

	<table style="border: 1px solid black">
		<tr style="background-color: #F74B4B">
			<th>META</th>
			<th>REFERENCIA</th>
			<th id="ref"><?php echo($ref); ?></th>
			<th>SAM</th>
			<th id="sam"><?php echo($sam); ?></th>
		</tr>
		<tr>
			<th id="meta" style="background-color: #AAAAAA"><?php echo($meta); ?></th>
			<th class="red">TOTAL UND</th>
			<th class="red" id="totalunidades"><?php echo($totalunidades); ?></th>
			<th class="red">N°PER</th>
			<th id="sam" class="red">3</th>
		</tr>
		<tr style="background-color: #39E014">
			<th>HORA</th>
			<th>META HORAS</th>
			<th>UNIDADES PRODUCIDAS</th>
			<th>UNIDADES ACUMULADAS</th>
			<th>EFICIENCIA %</th>
		</tr>

		<?php 
			for($i=0;$i<=($nh-1);$i++){ 
				$metaHoras[$i]=($i+1)*$meta;
				if ($i==0){
					$unidAcum[0]=$unidProd[0];
				}else{
					$unidAcum[$i]=$unidAcum[$i-1]+$unidProd[$i];
				}
				$eficien[$i]=$unidAcum[$i]*100/$metaHoras[$i];
			 ?>
			<tr>
				<td style="background-color: #3FF9D7"><?php echo($i+1); ?></td>
				<td style="color: #F9D23F" class="gris"><?php echo($metaHoras[$i]);; ?></td>
				<td style="color: #FFFFFF" class="gris"><?php echo($unidProd[$i]); ?></td>
				<td style="color: #E1E13D" class="gris"><?php echo($unidAcum[$i]); ?></td>
				<td style="color: #24D4B4" class="gris"><?php echo($eficien[$i]); ?>%</td>
			</tr>
		<?php } ?>
	</table>

	<div style="background: white">
		<?php 
	  		//Selector de cambio de módulo
	  		include "selectCambioModulo.php"; 
	  	?>
	</div>

	<script>
		var a=1;

		function cambiodemodulo(val) {
	  		url="conteoTablero.php?mod="+val;
	  		location.replace(url);
		}
		
		function loadDoc() {
  			const xhttp = new XMLHttpRequest();
  			xhttp.onload = function() {
    			document.getElementById("demo").innerHTML = this.responseText;
  			}
  			xhttp.open("GET", "ajax_info.txt");
  			xhttp.send();
		}
	</script>

</body>
</html>