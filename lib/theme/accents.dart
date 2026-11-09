import 'package:flutter/material.dart';

Color accentFor(String code) {
  switch (code) {
    case 'AB':
      return const Color(0xFFC45C26);
    case 'BC':
      return const Color(0xFF1B7A6A);
    case 'MB':
      return const Color(0xFF3E6B9E);
    case 'NB':
      return const Color(0xFFB4532A);
    case 'NL':
      return const Color(0xFF1D6F8A);
    case 'NS':
      return const Color(0xFF6B4C9A);
    case 'NT':
      return const Color(0xFF2F6F5E);
    case 'NU':
      return const Color(0xFFB06A2B);
    case 'ON':
      return const Color(0xFF1F6FA8);
    case 'PE':
      return const Color(0xFFC45B6A);
    case 'QC':
      return const Color(0xFF2C5F8A);
    case 'SK':
      return const Color(0xFFC49A2A);
    case 'YT':
      return const Color(0xFF3B7A4A);
    default:
      return const Color(0xFF0B6E63);
  }
}

Color accentFill(String code) => accentFor(code).withValues(alpha: 0.14);
