add_definitions(-DGVC_EXPORTS -DGVLIBDIR="${LIBRARY_INSTALL_DIR}/graphviz")

add_library(gvc STATIC
  # Header files
  ${GRAPHVIZ_LIB_DIR}/gvc/gvc.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvcext.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvcint.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvcjob.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvconfig.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvcommon.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvcproc.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvio.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvplugin.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvplugin_device.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvplugin_layout.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvplugin_loadimage.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvplugin_render.h
  ${GRAPHVIZ_LIB_DIR}/gvc/gvplugin_textlayout.h

  # Source files
  ${GRAPHVIZ_LIB_DIR}/gvc/gvc.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvconfig.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvcontext.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvdevice.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvevent.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvjobs.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvlayout.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvloadimage.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvplugin.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvrender.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvtextlayout.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvtool_tred.c
  ${GRAPHVIZ_LIB_DIR}/gvc/gvusershape.c
)

target_include_directories(gvc 
  PUBLIC
    ${GRAPHVIZ_LIB_DIR}
    ${GRAPHVIZ_LIB_DIR}/gvc
    ${GRAPHVIZ_LIB_DIR}/cdt
    ${GRAPHVIZ_LIB_DIR}/cgraph
    ${GRAPHVIZ_LIB_DIR}/common
    ${GRAPHVIZ_LIB_DIR}/pathplan
  PRIVATE
    ${GRAPHVIZ_BUILD_DIR}
)

target_link_libraries(gvc PRIVATE
  $<TARGET_OBJECTS:common_obj>
  $<TARGET_OBJECTS:pack_obj>
)

target_link_libraries(gvc PRIVATE
  cdt
  cgraph
  common
  pack
)

target_link_libraries(gvc PUBLIC
  ${MATH_LIB}
)

if(LTDL_FOUND)
  target_include_directories(gvc SYSTEM PRIVATE ${LTDL_INCLUDE_DIRS})
  if(NOT WIN32 OR MINGW)
    target_link_libraries(gvc PUBLIC ${LTDL_LIBRARIES})
  endif()
endif()

if(ZLIB_FOUND)
  target_link_libraries(gvc PUBLIC ${ZLIB_LIBRARIES})
endif()

