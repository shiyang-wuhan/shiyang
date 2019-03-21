attribute vec4 a_Position;
attribute vec2 a_textcoord;
uniform mat4 u_MvpMatrix;
uniform vec4 u_CameraPos;
uniform vec4 u_DistortionPos;

varying vec2 v_textcoord;
void main()
{
	vec4 pos = u_MvpMatrix * a_Position;
	float off = pos.z * 0.01;
	pos += u_DistortionPos * off * off;
	gl_Position = pos;
	v_textcoord = a_textcoord;
}