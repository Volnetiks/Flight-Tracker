class Aircraft {
  final String hex;
  final String type;
  final String? flight;
  final String? r;
  final String? t;
  final int? altBaro;
  final int? altGeom;
  final double? gs;
  final double? track;
  final int? squawk;
  final String? emergency;
  final String? category;
  final double? lat;
  final double? lon;
  final int nic;
  final int rc;
  final double seenPos;
  final int? version;
  final int? nicBaro;
  final int? nacP;
  final int? nacV;
  final int? sil;
  final String? silType;
  final int? gva;
  final int? sda;
  final int? alert;
  final int? spi;
  final List<dynamic> mlat;
  final List<dynamic> tisb;
  final int messages;
  final double seen;
  final double rssi;
  final double? baroRate;
  final double? geomRate;
  final double? ias;
  final double? tas;
  final double? mach;
  final int? wd;
  final int? ws;
  final int? oat;
  final int? tat;
  final double? trackRate;
  final double? roll;
  final double? magHeading;
  final double? trueHeading;
  final double? navQnh;
  final int? navAltitudeMcp;
  final int? navAltitudeFms;
  final List<String>? navModes;
  final double? dbFlags;
  final String? gpsOkBefore;
  final double? gpsOkLat;
  final double? gpsOkLon;

  Aircraft({
    required this.hex,
    required this.type,
    required this.flight,
    required this.r,
    required this.t,
    this.altBaro,
    this.altGeom,
    this.gs,
    this.track,
    this.squawk,
    this.emergency,
    required this.category,
    this.lat,
    this.lon,
    required this.nic,
    required this.rc,
    required this.seenPos,
    required this.version,
    required this.nicBaro,
    required this.nacP,
    required this.nacV,
    required this.sil,
    required this.silType,
    required this.gva,
    required this.sda,
    required this.alert,
    required this.spi,
    required this.mlat,
    required this.tisb,
    required this.messages,
    required this.seen,
    required this.rssi,
    this.baroRate,
    this.geomRate,
    this.ias,
    this.tas,
    this.mach,
    this.wd,
    this.ws,
    this.oat,
    this.tat,
    this.trackRate,
    this.roll,
    this.magHeading,
    this.trueHeading,
    this.navQnh,
    this.navAltitudeMcp,
    this.navAltitudeFms,
    this.navModes,
    this.dbFlags,
    this.gpsOkBefore,
    this.gpsOkLat,
    this.gpsOkLon,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) {
    return Aircraft(
      hex: json['hex'],
      type: json['type'],
      flight: json['flight'],
      r: json['r'],
      t: json['t'],
      altBaro: json['alt_baro'] == "ground" ? 0 : json['alt_baro'],
      altGeom: json['alt_geom'],
      gs: json["gs"] != null ? (json["gs"] as num).toDouble() : null,
      track: json["track"] != null ? (json["track"] as num).toDouble() : null,
      squawk: json['squawk'] == null ? null : int.tryParse(json['squawk']),
      emergency: json['emergency'],
      category: json['category'],
      lat: json['lat'],
      lon: json['lon'],
      nic: json['nic'],
      rc: json['rc'],
      seenPos: (json["seen_pos"] as num).toDouble(),
      version: json['version'],
      nicBaro: json['nic_baro'],
      nacP: json['nac_p'],
      nacV: json['nac_v'],
      sil: json['sil'],
      silType: json['sil_type'],
      gva: json['gva'],
      sda: json['sda'],
      alert: json['alert'],
      spi: json['spi'],
      mlat: List<dynamic>.from(json['mlat'].map((x) => x)),
      tisb: List<dynamic>.from(json['tisb'].map((x) => x)),
      messages: json['messages'],
      seen: (json["seen"] as num).toDouble(),
      rssi: (json["rssi"] as num).toDouble(),
      baroRate:
          json["baro_rate"] != null
              ? (json["baro_rate"] as num).toDouble()
              : null,
      geomRate:
          json["geom_rate"] != null
              ? (json["geom_rate"] as num).toDouble()
              : null,
      ias: json["ias"] != null ? (json["ias"] as num).toDouble() : null,
      tas: json["tas"] != null ? (json["tas"] as num).toDouble() : null,
      mach: json["mach"] != null ? (json["mach"] as num).toDouble() : null,
      wd: json['wd'],
      ws: json['ws'],
      oat: json['oat'],
      tat: json['tat'],
      trackRate:
          json["track_rate"] != null
              ? (json["track_rate"] as num).toDouble()
              : null,
      roll: json["roll"] != null ? (json["roll"] as num).toDouble() : null,
      magHeading:
          json["mag_heading"] != null
              ? (json["mag_heading"] as num).toDouble()
              : null,
      trueHeading:
          json["true_heading"] != null
              ? (json["true_heading"] as num).toDouble()
              : null,
      navQnh:
          json["nav_qnh"] != null ? (json["nav_qnh"] as num).toDouble() : null,
      navAltitudeMcp: json['nav_altitude_mcp'],
      navAltitudeFms: json['nav_altitude_fms'],
      navModes:
          json['nav_modes'] != null
              ? List<String>.from(json['nav_modes'].map((x) => x))
              : null,
      dbFlags:
          json["dbFlags"] != null ? (json["dbFlags"] as num).toDouble() : null,
      gpsOkBefore: json['gpsOkBefore'].toString(),
      gpsOkLat:
          json["gpsOkLat"] != null
              ? (json["gpsOkLat"] as num).toDouble()
              : null,
      gpsOkLon:
          json["gpsOkLon"] != null
              ? (json["gpsOkLon"] as num).toDouble()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hex': hex,
      'type': type,
      'flight': flight,
      'r': r,
      't': t,
      'alt_baro': altBaro,
      'alt_geom': altGeom,
      'gs': gs,
      'track': track,
      'squawk': squawk,
      'emergency': emergency,
      'category': category,
      'lat': lat,
      'lon': lon,
      'nic': nic,
      'rc': rc,
      'seen_pos': seenPos,
      'version': version,
      'nic_baro': nicBaro,
      'nac_p': nacP,
      'nac_v': nacV,
      'sil': sil,
      'sil_type': silType,
      'gva': gva,
      'sda': sda,
      'alert': alert,
      'spi': spi,
      'mlat': List<dynamic>.from(mlat.map((x) => x)),
      'tisb': List<dynamic>.from(tisb.map((x) => x)),
      'messages': messages,
      'seen': seen,
      'rssi': rssi,
      'baro_rate': baroRate,
      'geom_rate': geomRate,
      'ias': ias,
      'tas': tas,
      'mach': mach,
      'wd': wd,
      'ws': ws,
      'oat': oat,
      'tat': tat,
      'track_rate': trackRate,
      'roll': roll,
      'mag_heading': magHeading,
      'true_heading': trueHeading,
      'nav_qnh': navQnh,
      'nav_altitude_mcp': navAltitudeMcp,
      'nav_altitude_fms': navAltitudeFms,
      'nav_modes': navModes,
      'dbFlags': dbFlags,
      'gpsOkBefore': gpsOkBefore,
      'gpsOkLat': gpsOkLat,
      'gpsOkLon': gpsOkLon,
    };
  }
}
