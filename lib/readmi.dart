/*
  class "classname" extends StatelessWidget/StatefulWidget{

    --Stateful widget are mutable whereas stateless aren't

    const classname({super.key});
    --constant constructor "classname", its instance is created at compile time
    --"key" is passed as a constructor parameter used for identifying widgets 

    Widget build(BuildContext context) {
      --build method create widgets which is displayed in UI "context" describes --the current position of widget 

        return Scaffold/MaterialApp(
          --Scaffold - provides a basic material design layout
          --MaterialApp - provides a material design application
        );
    }
  }



*/