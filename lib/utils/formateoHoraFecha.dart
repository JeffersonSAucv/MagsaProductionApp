



import 'package:intl/intl.dart';

class FormatearDate{


   formatearHora( var horaJson){
      String hora= horaJson.toString();

    if (horaJson == null) {
      return '-';
    } else {

    var splitHora = hora.split(' '); //CORTA LA FECHA PARA MOSTRARLA CORRECTAMENTE

    if(int.parse(splitHora[1].substring(0,2)) <= 12){
      
      return "${splitHora[1].substring(0,5)} AM"; 

    } else{
      
      return "${splitHora[1].substring(0,5)} PM";
    }
    }
  }


  formatearFecha(var fechaJson){

    var formatoDate = DateFormat('dd-MM-yyyy');
    if (fechaJson == null) {
      return '-';
    } else {
      String mostrarfecha = formatoDate.format(fechaJson);
      return mostrarfecha;
    }
  }



}