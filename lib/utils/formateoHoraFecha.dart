



import 'package:intl/intl.dart';

class FormatearDate{


   formatearHora(String horaJson){
    var hora= horaJson;

    var splitHora = hora.split(' ');

    if(int.parse(splitHora[1].substring(0,2)) <= 12){
      
      return "${splitHora[1].substring(0,5)} AM"; 

    } else{
      
      return "${splitHora[1].substring(0,5)} PM";
    }
  }


  formatearFecha(var fechaJson){

    var formatoDate = DateFormat('dd-MM-yyyy');
    String mostrarfecha = formatoDate.format(fechaJson);
    return mostrarfecha;
  }



}