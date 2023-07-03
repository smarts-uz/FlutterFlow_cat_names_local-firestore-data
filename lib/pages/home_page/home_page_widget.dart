import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Cat Names',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 0.0,
              buttonSize: 40.0,
              fillColor: Colors.transparent,
              icon: Icon(
                Icons.favorite_rounded,
                color: Color(0xFFFF0000),
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('FavoritesPage');
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) {
                    final catNames = FFAppState().catNames.toList();
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: catNames.length,
                      separatorBuilder: (_, __) => SizedBox(height: 16.0),
                      itemBuilder: (context, catNamesIndex) {
                        final catNamesItem = catNames[catNamesIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              catNamesItem,
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            if (FFAppState()
                                .favoriteCatNames
                                .contains(catNamesItem))
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 0.0,
                                buttonSize: 40.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.favorite_rounded,
                                  color: Color(0xFFFF0000),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  if (FFAppState()
                                      .favoriteCatNames
                                      .contains(catNamesItem)) {
                                    setState(() {
                                      FFAppState().removeFromFavoriteCatNames(
                                          catNamesItem);
                                    });
                                  } else {
                                    setState(() {
                                      FFAppState()
                                          .addToFavoriteCatNames(catNamesItem);
                                    });
                                  }
                                },
                              ),
                            if (!FFAppState()
                                .favoriteCatNames
                                .contains(catNamesItem))
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 0.0,
                                buttonSize: 40.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.favorite_border_rounded,
                                  color: Color(0xFFFF0000),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  if (FFAppState()
                                      .favoriteCatNames
                                      .contains(catNamesItem)) {
                                    setState(() {
                                      FFAppState().removeFromFavoriteCatNames(
                                          catNamesItem);
                                    });
                                  } else {
                                    setState(() {
                                      FFAppState()
                                          .addToFavoriteCatNames(catNamesItem);
                                    });
                                  }
                                },
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
