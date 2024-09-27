

 // showGeneralDialog(
    //   context: context,
    //   pageBuilder: (BuildContext context, Animation<double> animation,
    //       Animation<double> secondaryAnimation) {
    //     return TouchBox(
    //       child: Padding(
    //         padding: EdgeInsets.only(top: 88.0, bottom: 0),
    //         child: Container(
    //           height: kScreenHeight,
    //           width: kScreenWidth,
    //           color: Colors.lightBlueAccent,
    //         ),
    //       ),
    //       onTap: () {
    //         Navigator.of(context).pop(true);
    //       },
    //     );
    //   },
    //   barrierLabel: 'false',
    //   barrierDismissible: true,
    //   barrierColor: Colors.black.withOpacity(0.3),
    //   transitionDuration: Durations.medium3,
    //   transitionBuilder: (BuildContext context, Animation<double> animation,
    //       Animation<double> secondaryAnimation, Widget child) {
    //     return SlideTransition(
    //       position: animation.drive(
    //         Tween<Offset>(
    //           begin: const Offset(0, 1),
    //           end: Offset.zero,
    //         ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
    //       ),
    //       child: child,
    //     );

    //     // return ScaleTransition(scale: animation, child: child);

    //     // return ScaleTransition(
    //     //   scale: Tween<double>(
    //     //     begin: .0,
    //     //     end: 300.0,
    //     //   ).animate(
    //     //     CurvedAnimation(
    //     //       parent: AnimationController(
    //     //           duration: Duration(seconds: 1), vsync: this),
    //     //       curve: const Interval(0.0, 1.0, curve: Curves.bounceOut),
    //     //     ),
    //     //   ),
    //     //   child: child,
    //     // );
    //   },
    // );

    // showBottomSheet(
    //   context: context,
    //   backgroundColor: Colors.lightGreenAccent,
    //   elevation: 20,
    //   shape: CircleBorder(),
    //   builder: (context) {
    //     return Container(
    //       alignment: Alignment.center,
    //       padding: EdgeInsets.only(top: 33.0, bottom: 33.0),
    //       child: Text(
    //         "bottomSheet的内容",
    //       ),
    //     );
    //   },
    // );

    // showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext bc) {
    //     return Container(
    //       height: 100,
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(10),
    //           topRight: Radius.circular(10),
    //         ),
    //       ),
    //       child: Container(
    //         child: Container(
    //           alignment: Alignment.center,
    //           padding: EdgeInsets.only(top: 33.0, bottom: 33.0),
    //           child: Text(
    //             "bottomSheet的内容",
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );

    // showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext bc) {
    //     return Stack(
    //       children: <Widget>[
    //         Container(
    //           height: 30.0,
    //           width: double.infinity,
    //           color: Colors.yellow,
    //         ),
    //         Container(
    //           decoration: BoxDecoration(
    //             color: Colors.redAccent,
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(25),
    //               topRight: Radius.circular(25),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           child: Container(
    //             alignment: Alignment.center,
    //             padding: EdgeInsets.only(top: 33.0, bottom: 33.0),
    //             child: Text(
    //               "bottomSheet的内容",
    //             ),
    //           ),
    //         ),
    //       ],
    //     );
    //   },
    // );