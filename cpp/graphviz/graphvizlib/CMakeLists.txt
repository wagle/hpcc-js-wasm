PROJECT(graphvizlib)

# See:  https://github.com/emscripten-core/emscripten/blob/main/src/settings.js
SET(EM_FLAGS 
    ${EM_FLAGS}
    "-s FILESYSTEM=1"
    "-s EXPORT_NAME='${CMAKE_PROJECT_NAME}'"
    "-s EXPORTED_FUNCTIONS=\"[_free]\""
    "-s EXPORTED_RUNTIME_METHODS=\"[]\""
    "--post-js ${CMAKE_CURRENT_BINARY_DIR}/main_glue.js"
)
STRING(REPLACE ";" " " LINK_FLAGS "${EM_FLAGS}")

#  Generate Glue from IDL file  ---
ADD_CUSTOM_COMMAND(
    MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/main.idl
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/main_glue.js ${CMAKE_CURRENT_BINARY_DIR}/main_glue.cpp
    COMMAND python3 ${CMAKE_BINARY_DIR}/../emsdk/upstream/emscripten/tools/webidl_binder.py ${CMAKE_CURRENT_SOURCE_DIR}/main.idl ${CMAKE_CURRENT_BINARY_DIR}/main_glue
)
SET_PROPERTY(SOURCE main.cpp APPEND PROPERTY OBJECT_DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/main_glue.cpp)
#  ---  ---  ---

SET(SRCS
    main.cpp
)

INCLUDE_DIRECTORIES(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${GRAPHVIZ_LIB_DIR}
    ${GRAPHVIZ_LIB_DIR}/cdt
    ${GRAPHVIZ_LIB_DIR}/cgraph
    ${GRAPHVIZ_LIB_DIR}/cgraph++
    ${GRAPHVIZ_LIB_DIR}/common
    ${GRAPHVIZ_LIB_DIR}/gvc
    ${GRAPHVIZ_LIB_DIR}/gvc++
    ${GRAPHVIZ_LIB_DIR}/pathplan
    ${GRAPHVIZ_LIB_DIR}/sparse
)

ADD_EXECUTABLE(graphvizlib
    ${SRCS}
)

SET_TARGET_PROPERTIES(graphvizlib PROPERTIES LINK_FLAGS "${LINK_FLAGS} -s ENVIRONMENT=webview")
# target_compile_features(graphvizlib PUBLIC cxx_std_17)

TARGET_LINK_LIBRARIES(graphvizlib PRIVATE
    gvplugin_core
    gvplugin_dot_layout
    gvplugin_neato_layout
    ortho
)

# ADD_EXECUTABLE(graphvizlib-web
#     ${SRCS}
# )

# SET_TARGET_PROPERTIES(graphvizlib-web PROPERTIES LINK_FLAGS "${LINK_FLAGS} -s ENVIRONMENT=web")

# TARGET_LINK_LIBRARIES(graphvizlib-web PRIVATE
#     gvplugin_core
#     gvplugin_dot_layout
#     gvplugin_neato_layout
#     ortho
# )

# ADD_EXECUTABLE(graphvizlib-worker
#     ${SRCS}
# )

# SET_TARGET_PROPERTIES(graphvizlib-worker PROPERTIES LINK_FLAGS "${LINK_FLAGS} -s ENVIRONMENT=worker")

# TARGET_LINK_LIBRARIES(graphvizlib-worker PRIVATE
#     gvplugin_core
#     gvplugin_dot_layout
#     gvplugin_neato_layout
#     ortho
# )

# ADD_EXECUTABLE(graphvizlib-node
#     ${SRCS}
# )

# SET_TARGET_PROPERTIES(graphvizlib-node PROPERTIES LINK_FLAGS "${LINK_FLAGS} -s ENVIRONMENT=node")

# TARGET_LINK_LIBRARIES(graphvizlib-node PRIVATE
#     gvplugin_core
#     gvplugin_dot_layout
#     gvplugin_neato_layout
#     ortho
# )
