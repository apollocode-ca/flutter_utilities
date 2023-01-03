import 'package:flutter/material.dart';

// To build a new Material Theme:
// https://www.figma.com/community/plugin/1034969338659738588/Material-Theme-Builder

class ColorSchemeProvider {
  ColorScheme getFrom(Brightness brightness) {
    return ColorScheme(
      background: _getBackgroundFrom(brightness),
      brightness: brightness,
      error: _getErrorFrom(brightness),
      errorContainer: _getErrorContainerFrom(brightness),
      inversePrimary: _getInversePrimaryFrom(brightness),
      inverseSurface: _getInverseSurfaceFrom(brightness),
      onBackground: _getOnBackgroundFrom(brightness),
      onError: _getOnErrorFrom(brightness),
      onErrorContainer: _getOnErrorContainerFrom(brightness),
      onInverseSurface: _getOnInverseSurfaceFrom(brightness),
      onPrimary: _getOnPrimaryFrom(brightness),
      onPrimaryContainer: _getOnPrimaryContainerFrom(brightness),
      onSecondary: _getOnSecondaryFrom(brightness),
      onSecondaryContainer: _getOnSecondaryContainerFrom(brightness),
      onSurface: _getOnSurfaceFrom(brightness),
      onSurfaceVariant: _getOnSurfaceVariantFrom(brightness),
      onTertiary: _getOnTertiaryFrom(brightness),
      onTertiaryContainer: _getOnTertiaryContainerFrom(brightness),
      outline: _getOutlineFrom(brightness),
      primary: _getPrimaryFrom(brightness),
      primaryContainer: _getPrimaryContainerFrom(brightness),
      secondary: _getSecondaryFrom(brightness),
      secondaryContainer: _getSecondaryContainerFrom(brightness),
      shadow: _shadow,
      surface: _getSurfaceFrom(brightness),
      surfaceTint: _getSurfaceTintFrom(brightness),
      surfaceVariant: _getSurfaceVariantFrom(brightness),
      tertiary: _getTertiaryFrom(brightness),
      tertiaryContainer: _getTertiaryContainerFrom(brightness),
    );
  }

  Color getDarkerPrimaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      // Primary30
      return const Color(0xFF910B00);
    }
    // Primary70
    return const Color(0xFFFF8A76);
  }

  Color getLighterPrimaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      // Primary50
      return const Color(0xFFEB1900);
    }
    // Primary90
    return const Color(0xFFFFDAD4);
  }

  Color get _shadow {
    return const Color(0xFF000000);
  }

  Color _getBackgroundFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFFBFF);
    }
    return const Color(0xFF201A19);
  }

  Color _getErrorFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFBA1A1A);
    }
    return const Color(0xFFFFB4AB);
  }

  Color _getErrorContainerFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFDAD6);
    }
    return const Color(0xFF93000A);
  }

  Color _getInversePrimaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFB4A7);
    }
    return const Color(0xFFBD1200);
  }

  Color _getInverseSurfaceFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF362F2D);
    }
    return const Color(0xFFEDE0DD);
  }

  Color _getOnBackgroundFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF201A19);
    }
    return const Color(0xFFEDE0DD);
  }

  Color _getOnErrorFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFFFFF);
    }
    return const Color(0xFF690005);
  }

  Color _getOnErrorContainerFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF410002);
    }
    return const Color(0xFFFFB4AB);
  }

  Color _getOnInverseSurfaceFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFBEEEB);
    }
    return const Color(0xFF362F2D);
  }

  Color _getOnPrimaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFFFFF);
    }
    return const Color(0xFF670600);
  }

  Color _getOnPrimaryContainerFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF400200);
    }
    return const Color(0xFFFFDAD4);
  }

  Color _getOnSecondaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFFFFF);
    }
    return const Color(0xFF561E15);
  }

  Color _getOnSecondaryContainerFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF3A0904);
    }
    return const Color(0xFFFFDAD4);
  }

  Color _getOnSurfaceFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF201A19);
    }
    return const Color(0xFFEDE0DD);
  }

  Color _getOnSurfaceVariantFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF534340);
    }
    return const Color(0xFFD8C2BE);
  }

  Color _getOnTertiaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFFFFF);
    }
    return const Color(0xFF3E2E00);
  }

  Color _getOnTertiaryContainerFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF251A00);
    }
    return const Color(0xFFFFDF96);
  }

  Color _getOutlineFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF857370);
    }
    return const Color(0xFFA08C89);
  }

  Color _getPrimaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFBD1200);
    }
    return const Color(0xFFFFB4A7);
  }

  Color _getPrimaryContainerFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFDAD4);
    }
    return const Color(0xFF910B00);
  }

  Color _getSecondaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF904B3F);
    }
    return const Color(0xFFFFB4A7);
  }

  Color _getSecondaryContainerFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFDAD4);
    }
    return const Color(0xFF733429);
  }

  Color _getSurfaceFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFFBFF);
    }
    return const Color(0xFF201A19);
  }

  Color _getSurfaceTintFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFBD1200);
    }
    return const Color(0xFFFFB4A7);
  }

  Color _getSurfaceVariantFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFF5DDD9);
    }
    return const Color(0xFF534340);
  }

  Color _getTertiaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFF765A00);
    }
    return const Color(0xFFF2C030);
  }

  Color _getTertiaryContainerFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const Color(0xFFFFDF96);
    }
    return const Color(0xFF5A4400);
  }
}
