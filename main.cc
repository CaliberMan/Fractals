#include <stdio.h>
#include "imgui.h"
#include "backends/imgui_impl_glfw.h"
#include "backends/imgui_impl_opengl3.h"
#include <GLFW/glfw3.h>
#include <GL/gl.h>

int main() {
  // GLFW init
  if (!glfwInit()) {
    fprintf(stderr, "Failed to initialize GLFW\n");
    return -1;
  }

  // GLFW window creation
  GLFWwindow* window = glfwCreateWindow(1280, 720, "Hello, world!", NULL, NULL);
  if (!window) {
    fprintf(stderr, "Failed to create GLFW window\n");
    glfwTerminate();
    return -1;
  }

  // GLFW window setup
  glfwMakeContextCurrent(window);
  glfwSwapInterval(1);

  // ImGui init
  IMGUI_CHECKVERSION();
  ImGui::CreateContext();
  ImGuiIO& io = ImGui::GetIO(); (void)io;

  // ImGui style
  ImGui::StyleColorsDark();

  // ImGui backend init
  ImGui_ImplGlfw_InitForOpenGL(window, true);
  ImGui_ImplOpenGL3_Init("#version 130");

  bool done = false;
  while (!done) {
    if (done) break;

    // GLFW process events
    glfwPollEvents();
    if (glfwWindowShouldClose(window)) {
      done = true;
    }

    // ImGui new frame
    ImGui_ImplOpenGL3_NewFrame();
    ImGui_ImplGlfw_NewFrame();
    ImGui::NewFrame();

    // ImGui render
    ImGui::Render();

    // ImGui swap buffers
    glfwSwapBuffers(window);
  }

  // Cleanup
  ImGui_ImplOpenGL3_Shutdown();
  ImGui_ImplGlfw_Shutdown();
  ImGui::DestroyContext();

  glfwDestroyWindow(window);
  glfwTerminate();

  return 0;
}