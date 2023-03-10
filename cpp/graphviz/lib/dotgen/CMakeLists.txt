
add_library(dotgen STATIC
  # Header files
  ${GRAPHVIZ_LIB_DIR}/dotgen/aspect.h
  ${GRAPHVIZ_LIB_DIR}/dotgen/dot.h
  ${GRAPHVIZ_LIB_DIR}/dotgen/dotprocs.h

  # Source files
  ${GRAPHVIZ_LIB_DIR}/dotgen/aspect.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/acyclic.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/class1.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/class2.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/cluster.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/compound.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/conc.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/decomp.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/dotinit.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/dotsplines.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/fastgr.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/flat.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/mincross.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/position.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/rank.c
  ${GRAPHVIZ_LIB_DIR}/dotgen/sameport.c
)

target_include_directories(dotgen PRIVATE
  ${GRAPHVIZ_LIB_DIR}
  ${GRAPHVIZ_LIB_DIR}/cdt
  ${GRAPHVIZ_LIB_DIR}/cgraph
  ${GRAPHVIZ_LIB_DIR}/common
  ${GRAPHVIZ_LIB_DIR}/gvc
  ${GRAPHVIZ_LIB_DIR}/pack
  ${GRAPHVIZ_LIB_DIR}/pathplan
)

target_link_libraries(dotgen PRIVATE
  cgraph
)
