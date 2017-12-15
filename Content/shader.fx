/* sampler s0;
texture lightMask;
sampler lightSampler = sampler_state { texture = <lightMask>; };

float4 PixelShaderFunction(float4 pos : SV_POSITION, float4 color1 : COLOR0, float2 coords : TEXCOORD0) : COLOR0
{
    float4 color = tex2D(s0, coords);
    float4 lightColor = tex2D(lightSampler, coords);
    return color * lightColor;
}

technique Technique1
{
    pass Pass1
    {
        PixelShader = compile ps_4_0_level_9_1 PixelShaderFunction();
    }
}
*/

texture lightMask;
sampler s0;
sampler lightSampler : register(s1) = sampler_state 
{
	Texture = <lightMask>;
	AddressU = Clamp;
	AddressV = Clamp;
};
float4 PixelShaderFunction(float4 pos : SV_POSITION, float4 color1 : COLOR0, float2 coords : TEXCOORD0) : SV_TARGET0
{
	float4 color = tex2D(s0, coords);
	float4 lightColor = tex2D(lightSampler, coords);
	return color * lightColor;
}

technique Technique1 
{
	pass Pass1
	{
		PixelShader = compile ps_4_0_level_9_1 PixelShaderFunction();
	}
}