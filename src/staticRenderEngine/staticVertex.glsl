#version 400 core

in vec3 position; //takes in 3d vector of vertex coords
in vec2 textureCoords;

out vec2 pass_textureCoords;

void main() {

    gl_Position = vec4(position.xyz,1.0);

    pass_textureCoords = textureCoords;

}
