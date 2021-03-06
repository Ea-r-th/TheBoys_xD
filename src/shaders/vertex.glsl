#version 400 core

in vec3 position; //takes in 3d vector of vertex coords
in vec2 textureCoords;
in vec3 normal;

//out vec3 color; //outputs colors to linearly interpolate

out vec2 pass_textureCoords;
out vec3 surfaceNormal;
out vec3 toLightVector;
out vec4 toCameraVector;

//Takes in outside information to change shading
uniform mat4 transformationMatrix;
uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform vec3 lightPosition;

void main() {
    vec4 worldPosition = transformationMatrix * vec4(position,1.0);

    gl_Position = projectionMatrix * viewMatrix * transformationMatrix * vec4(position.xyz,1.0);
    pass_textureCoords = textureCoords; //Passes the texture coordinates to the fragment shader

    surfaceNormal = (transformationMatrix * vec4(normal,0.0)).xyz; //Normal vector
    toLightVector = (lightPosition - worldPosition.xyz); //Vector towards the light
    toCameraVector = inverse(viewMatrix) * vec4(0.0,0.0,0.0,1.0); - worldPosition;
}
