import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:boton_panico/widgets/textfield_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:record_mp3/record_mp3.dart';
import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


import '../pages/button_start_page.dart';
import '../services/eventos_services.dart';

class FormEventWidget extends StatefulWidget {
  const FormEventWidget({super.key});

  @override
  State<FormEventWidget> createState() => _FormEventWidgetState();
}

class _FormEventWidgetState extends State<FormEventWidget> {

  File? image;
  final ImagePicker _imagePicker = ImagePicker();
  Future selectImage(option) async {
    XFile? pickedFile;
    if (option == 1) {
      pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        Fluttertoast.showToast(msg: "No seleccionó ninguna imagen");
      }
    });
  }

  bool loading = false;

  final audioPlayer = AudioPlayer();
  String statusText = "";
  bool isComplete = false;
  bool isRecording = false;
  String? recordFilePath;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  void initPlayer() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      if (!mounted) return;
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      if (!mounted) return;
      setState(() {
        position = newPosition;
      });
    });
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  Future setAudio() async {
    audioPlayer.setUrl(recordFilePath!, isLocal: true);
  }


  @override
  Widget build(BuildContext context) {

    final args          =  (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    final String imagen = _imagen(args["tipo"]);
    final TextEditingController desController    = TextEditingController();
    final eventosServices = EventosServices();
    
    if (mounted) {
      initPlayer();
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      //alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Editar emergencia generada", 
            textAlign: TextAlign.center,
            style: TextStyle(
              color : Color.fromRGBO(255, 192, 0, 10),
              fontSize: 30,
              fontWeight: FontWeight.bold
              ),
            ),
            
            const SizedBoxWidget(heightSized: 10),

            const Text(
              "*Adiciona las evidencias que consideres necesarias.",
              style: TextStyle(
                color: Colors.black38
              ),
            ),
            const SizedBoxWidget(heightSized: 30),

            Card(
              elevation: 5,
              shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: [
                  const SizedBoxWidget(heightSized: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            
                      Image.asset(
                        "assets/$imagen.png",
                        height : 30,
                        width  : 30,
                      ),
            
                       Text( 
                        " ${"${args['tipo']}".substring(0, 1).toUpperCase()}${"${args['tipo']}".substring(1).toLowerCase()}",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBoxWidget(heightSized: 10),
            
                  TextFieldWidget(label: "Descripción del evento", controllerText: desController),

                  const SizedBoxWidget(heightSized: 10),
                ],
              ),
            ),

            const SizedBoxWidget(heightSized: 5),

            Card(
              elevation: 5,
              shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: [
                  const SizedBoxWidget(heightSized: 15),
                  const Text(
                    "*Graba un audio contando lo ocurrido",
                    style: TextStyle(
                      color: Colors.black38
                    ),
                  ),
            
                  const SizedBoxWidget(heightSized: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shadowColor: const Color.fromRGBO(255, 192, 0, 10),
                      elevation: 7
                    ),
                    child: Icon(
                      isRecording ? Icons.stop : Icons.mic,
                      size: 50,
                      color: Colors.black26,
                    ),
                    onPressed: () async {
                      if (isRecording) {
                        stopRecord();
                      } else {
                        startRecord();
                      }
                    },
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(160, 255, 192, 0),
                        child: IconButton(
                          onPressed: () async {
                            if (isPlaying) {
                              await audioPlayer.pause();
                            } else {
                              await audioPlayer.resume();
                            }
                          },
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,

                            ),
                          iconSize: 25,
                        ),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.height*0.35,
                        child: Column(
                          children: [
                            Slider(
                              thumbColor: Colors.black26,
                              inactiveColor:  Colors.black12,
                              activeColor: const Color.fromRGBO(255, 192, 0, 10),
                              min: 0,
                              max: duration.inSeconds.toDouble(),
                              value: position.inSeconds.toDouble(),
                              onChanged: (value) async {
                                final position = Duration(seconds: value.toInt());
                                await audioPlayer.seek(position);
                                await audioPlayer.resume();
                              },
                            ),
            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  formatTime(position),
                                  style: const TextStyle(color: Colors.black),
                                ),

                                Spacer(),

                                Text(
                                  formatTime(duration),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBoxWidget(heightSized: 10),
                ],
              ),
            ),
            
            const SizedBoxWidget(heightSized: 30),

            _getOptions(),
            
            const SizedBoxWidget(heightSized: 20),

            _showImage(),

            const SizedBoxWidget(heightSized: 20),

            SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width*0.55,
            child: ElevatedButton(
              onPressed: () => showDialog<String> (
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('¡Gracias por tu reporte!'),
                  content: const Text('Atenderemos la emergencia lo más pronto posible.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        eventosServices.crearEvento(args['lat'], args['lon'], args['tipo'], desController.
                        text);
                        print(recordFilePath);
                        print(image);
                        if(image == null || recordFilePath == null) {
                          if(image == null && recordFilePath != null){
                            eventosServices.attachFiles("", recordFilePath!);
                          } else if (image != null && recordFilePath == null) {
                            eventosServices.attachFiles(image!.path, "");
                          } else {
                            eventosServices.attachFiles("", "");
                          }
                        } else {
                          eventosServices.attachFiles(image!.path, recordFilePath!);
                        }
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(
                            builder: (BuildContext context){
                              return const ButtonStartPage();
                            },
                          ),  (Route<dynamic> route) => false
                        );
                      },

                      child: const Text(
                        'OK',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 192, 0, 10),
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ),
                  ],
                ),
              ),


              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(255, 192, 0, 10),
              ),
              child: const Text(
                "Enviar reporte",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            ),

            const SizedBoxWidget(heightSized: 40),
          ],
        ),
      ),
    );
  }

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      isRecording = true;
      RecordMp3.instance.start(recordFilePath!, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No microphone permission'),
        ),
      );
    }
    setState(() {});
  }

  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      isRecording = false;
      setAudio();
      setState(() {});
    }
  }

  void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      setState(() {});
    }
  }

  int i = 0;
  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = "${storageDirectory.path}/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return "$sdPath/test_${i++}.mp3";
  }
  
 

  Widget _getOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () => {selectImage(1)},
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: Color.fromRGBO(255, 192, 0, 10)
                  )
                ),
            color: const Color.fromARGB(255, 255, 255, 255),
            elevation: 7,
            shadowColor:  const Color.fromRGBO(255, 192, 0, 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(children: const [
                Icon(
                  Icons.camera_alt,
                  color: Colors.black26,
                  size: 45,
                ),
                Text(
                  "Cámara",
                  style: TextStyle(
                      color: Colors.black26,
                      fontFamily: 'Roboto',
                      fontSize: 20
                  ),    
                ),
              ]),
            ),
          ),
        ),
        
        GestureDetector(
          onTap: () => {selectImage(2)},
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: Color.fromRGBO(255, 192, 0, 10)
                )
              ),
            color: const Color.fromARGB(255, 255, 255, 255),
            elevation: 7,
            shadowColor:  const Color.fromRGBO(255, 192, 0, 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: Column(children: const [
                Icon(
                  Icons.image,
                  color: Colors.black26,
                  size: 45,
                ),
                Text(
                  "Galeria",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black26,
                      fontSize: 20
                  )
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _showImage() {
    Widget imgOut = const Center();
    if (image != null) {
      imgOut = Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Colors.white,
          elevation: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                    aspectRatio: 12.0 / 13.0,
                    child: !kIsWeb ? Image.file(image!, fit: BoxFit.fill) : Image.network(image!.path)),
              ),
              Center(
                child: ButtonBar(
                  children: <Widget>[
                    loading
                        ? const Center(child: CircularProgressIndicator(
                          color: Color.fromRGBO(255,192,0,10),
                        ))
                        : const Center(),
                    Column(
                      children: [
                        TextButton(
                          child: Column(
                            children: const [
                              Icon(
                                Icons.cancel,
                                color: Color.fromRGBO(255,192,0,10)
                              ),
                              Text(
                                "Cancelar",
                                style: TextStyle(
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            image = null;
                            loading = false;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return imgOut;
  }
}

_imagen(String imagen){
  
  switch(imagen) { 
    case "ROBO": { 
        return "robo";
    } 
    case "ACCIDENTE": { 
        return "accidente-de-auto";
    }

    case "INCENDIO": { 
        return "extintor-de-incendios";
    }  

    case "ARMAS": { 
        return "armas-de-fuego";
    } 

    case "SUSTANCIAS": { 
        return "marihuana";
    } 

    case "DESLIZAMIENTO": { 
        return "deslizamiento-de-tierra";
    }

    case "OTROS": { 
        return "mas";
    }  

    default: { 
        return "robo";
    }
  } 
}
