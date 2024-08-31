import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:testeboaldo/routes.g.dart';

class SlpashPage extends StatefulWidget {
  const SlpashPage({super.key});

  @override
  State<SlpashPage> createState() => _SlpashPageState();
}

class _SlpashPageState extends State<SlpashPage> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Routefly.navigate(routePaths.home);
    });
  }
  
  @override
    Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text("Splash Page"),
      ),
    );
  }
}