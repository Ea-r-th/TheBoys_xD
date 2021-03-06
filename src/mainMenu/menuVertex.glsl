#version 400 core

in vec3 position; //takes in 3d vector of vertex coords
in vec2 textureCoords;

//out vec3 color; //outputs colors to linearly interpolate

out vec2 pass_textureCoords;

uniform mat4 transformationMatrix;
uniform mat4 viewMatrix;

void main() {

    gl_Position =  viewMatrix * transformationMatrix * vec4(position.xyz,1.0);
    //color = vec3(position.x+0.5,0.0,position.y+0.5);
    pass_textureCoords = textureCoords;
}