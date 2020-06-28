import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google98/utils/utils.dart';
import 'package:google98/vos/custom_colors.dart';

class TextButton extends StatefulWidget {

  final String lbl;
  final String link;
  final double size;

  TextButton(this.lbl, [this.link='', this.size=14.0]);
  
  @override
  _TextButtonState createState() => _TextButtonState();
}

class _TextButtonState extends State<TextButton> {

  bool hovered = false;
  bool visited = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (PointerHoverEvent evt) {
        setState(() {
          hovered = true;
        }); 
      },
      onExit: (PointerExitEvent evt) {
        setState(() {
          hovered = false;
        }); 
      },
      child: SizedBox(
        height: widget.size+widget.size/3,
        child: FlatButton(
          onPressed: () async {
            if(widget.link != '') {
              setState(() {
                visited = true;
              }); 
              await Utils.launchInBrowser(widget.link);
            }
          },
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          color: Colors.transparent,
          child: Text('${widget.lbl}', style: TextStyle(color: (hovered||visited)?CustomColors.indigo:CustomColors.blue, fontSize: widget.size, decoration: TextDecoration.underline)),
        ),
      ),
    );
  }

}