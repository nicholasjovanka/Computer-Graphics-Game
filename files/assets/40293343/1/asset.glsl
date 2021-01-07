uniform sampler2D texture_normalMap;
uniform float material_bumpiness;

uniform vec2 layer1_offset;
uniform vec2 layer2_offset;
    
void getNormal() {
    vec3 normalMap = unpackNormal(texture2D(texture_normalMap, $UV + layer1_offset));
    vec3 normalMap2 = unpackNormal(texture2D(texture_normalMap, $UV * 4.0 + layer2_offset));
    vec3 normalMap3 = unpackNormal(texture2D(texture_normalMap, $UV * 0.25));
    
    normalMap = normalize(vec3(normalMap3.xy + normalMap.xy, normalMap3.z * normalMap.z));
    normalMap = normalize(vec3(normalMap.xy + normalMap2.xy, normalMap.z * normalMap2.z));
    
    dNormalMap = normalMap;
    dNormalW = dTBN * normalMap;
}
