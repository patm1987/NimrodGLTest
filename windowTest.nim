import graphics, sdl, opengl

const width = 640
const height = 480

proc configureSDL() :bool =
  var surface: sdl.PSurface = setVideoMode(width, height, 32, cast[int32](sdl.OPENGL or sdl.FULLSCREEN))
  if surface == nil: return true
  return false

proc setupOpenGL() =
  glClearColor(0,1,0,1)
  glViewport(0,0,width,height)

when isMainModule:
  var surface: graphics.PSurface = newScreenSurface(640, 480)

  if (configureSDL()):
    setupOpenGL()

    withEvents(surface, event):
      case event.kind
      of sdl.QUITEV:
        break
      else: nil
