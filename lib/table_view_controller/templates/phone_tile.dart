import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/text.dart';

class CupertinoPhoneListTile extends StatelessWidget {
  final String? subtitle, title;
  final List<Widget>? actions;
  final IconData? icon;
  final bool? hideLeadingIcon;

  const CupertinoPhoneListTile({
    this.actions,
    this.subtitle,
    required this.title,
    this.icon,
    this.hideLeadingIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget row;
    if (subtitle == null) {
      row = Container(
        // color: selected ? Colors.grey[400] : Colors.transparent,
        height: 40.0,
        padding: EdgeInsets.only(top: subtitle == null ? 0.0 : 9.0),
        child: Row(
          children: <Widget>[
            Container(
              width: hideLeadingIcon! ? 12.0 : 38.0,
              child: icon != null && !hideLeadingIcon!
                  ? Align(
                      alignment: Alignment.center,
                      child: Icon(
                        icon,
                        color: CupertinoColors.inactiveGray,
                        size: 18.0,
                      ),
                    )
                  : null,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(left: 1.0, bottom: 0.0, right: 10.0),
                child: Row(
                    children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CupertinoText(title, type: CupertinoTextTheme.title)
                      ],
                    ),
                  ),
                ]..addAll(actions ?? <Widget>[])),
              ),
            ),
          ],
        ),
      );
    } else {
      row = Container(
        // color: selected ? Colors.grey[400] : Colors.transparent,
        height: 60.0,
        padding: const EdgeInsets.only(top: 9.0),
        child: Row(
          children: <Widget>[
            Container(
              width: hideLeadingIcon! ? 12.0 : 38.0,
              child: icon != null && !hideLeadingIcon!
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        icon,
                        color: CupertinoColors.inactiveGray,
                        size: 18.0,
                      ),
                    )
                  : null,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(left: 1.0, bottom: 9.0, right: 10.0),
                child: Row(
                    children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CupertinoText(title, type: CupertinoTextTheme.title),
                        CupertinoText(subtitle,
                            type: CupertinoTextTheme.subtitle),
                      ],
                    ),
                  ),
                ]..addAll(actions ?? <Widget>[])),
              ),
            ),
          ],
        ),
      );
    }

    return row;
  }
}
