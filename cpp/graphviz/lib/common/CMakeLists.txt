
add_definitions(-DGVC_EXPORTS)

add_library(common_obj OBJECT
  # Header files
  ${GRAPHVIZ_LIB_DIR}/common/arith.h
  ${GRAPHVIZ_LIB_DIR}/common/color.h
  ${GRAPHVIZ_LIB_DIR}/common/colorprocs.h
  ${GRAPHVIZ_BUILD_DIR}/lib/common/common/colortbl.h
  ${GRAPHVIZ_LIB_DIR}/common/const.h
  ${GRAPHVIZ_LIB_DIR}/common/entities.h
  ${GRAPHVIZ_LIB_DIR}/common/geom.h
  ${GRAPHVIZ_LIB_DIR}/common/geomprocs.h
  ${GRAPHVIZ_LIB_DIR}/common/globals.h
  ${GRAPHVIZ_LIB_DIR}/common/intset.h
  ${GRAPHVIZ_LIB_DIR}/common/htmllex.h
  ${GRAPHVIZ_LIB_DIR}/common/htmltable.h
  ${GRAPHVIZ_LIB_DIR}/common/macros.h
  ${GRAPHVIZ_LIB_DIR}/common/memory.h
  ${GRAPHVIZ_LIB_DIR}/common/pointset.h
  ${GRAPHVIZ_LIB_DIR}/common/ps_font_equiv.h
  ${GRAPHVIZ_LIB_DIR}/common/render.h
  ${GRAPHVIZ_LIB_DIR}/common/textspan.h
  ${GRAPHVIZ_LIB_DIR}/common/textspan_lut.h
  ${GRAPHVIZ_LIB_DIR}/common/types.h
  ${GRAPHVIZ_LIB_DIR}/common/usershape.h
  ${GRAPHVIZ_LIB_DIR}/common/utils.h

  # Source files
  ${GRAPHVIZ_LIB_DIR}/common/args.c
  ${GRAPHVIZ_LIB_DIR}/common/arrows.c
  ${GRAPHVIZ_LIB_DIR}/common/colxlate.c
  ${GRAPHVIZ_LIB_DIR}/common/ellipse.c
  ${GRAPHVIZ_LIB_DIR}/common/emit.c
  ${GRAPHVIZ_LIB_DIR}/common/geom.c
  ${GRAPHVIZ_LIB_DIR}/common/globals.c
  ${GRAPHVIZ_LIB_DIR}/common/htmllex.c
  ${GRAPHVIZ_LIB_DIR}/common/htmltable.c
  ${GRAPHVIZ_LIB_DIR}/common/input.c
  ${GRAPHVIZ_LIB_DIR}/common/intset.c
  ${GRAPHVIZ_LIB_DIR}/common/labels.c
  ${GRAPHVIZ_LIB_DIR}/common/ns.c
  ${GRAPHVIZ_LIB_DIR}/common/memory.c
  ${GRAPHVIZ_LIB_DIR}/common/output.c
  ${GRAPHVIZ_LIB_DIR}/common/pointset.c
  ${GRAPHVIZ_LIB_DIR}/common/postproc.c
  ${GRAPHVIZ_LIB_DIR}/common/psusershape.c
  ${GRAPHVIZ_LIB_DIR}/common/routespl.c
  ${GRAPHVIZ_LIB_DIR}/common/shapes.c
  ${GRAPHVIZ_LIB_DIR}/common/splines.c
  ${GRAPHVIZ_LIB_DIR}/common/taper.c
  ${GRAPHVIZ_LIB_DIR}/common/textspan.c
  ${GRAPHVIZ_LIB_DIR}/common/textspan_lut.c
  ${GRAPHVIZ_LIB_DIR}/common/timing.c
  ${GRAPHVIZ_LIB_DIR}/common/utils.c
  ${GRAPHVIZ_LIB_DIR}/common/xml.c

  # Generated files
  ${GRAPHVIZ_BUILD_DIR}/lib/common/htmlparse.c
)

target_include_directories(common_obj PRIVATE
  ${GRAPHVIZ_LIB_DIR}
  ${GRAPHVIZ_LIB_DIR}/common
  ${GRAPHVIZ_BUILD_DIR}/lib/common
  ${GRAPHVIZ_LIB_DIR}/cdt
  ${GRAPHVIZ_LIB_DIR}/cgraph
  ${GRAPHVIZ_LIB_DIR}/gvc
  ${GRAPHVIZ_LIB_DIR}/pack
  ${GRAPHVIZ_LIB_DIR}/pathplan
  ${GRAPHVIZ_LIB_DIR}/xdot
)

target_include_directories(common_obj SYSTEM PRIVATE
  ${EXPAT_DIR}/lib
)
add_library(common STATIC
  $<TARGET_OBJECTS:common_obj>
)

target_link_libraries(common PRIVATE
  cgraph
  pathplan
  label
  xdot
)

if(EXPAT_FOUND)
  target_link_libraries(common PRIVATE
    ${EXPAT_LIBRARIES}
  )
endif()

