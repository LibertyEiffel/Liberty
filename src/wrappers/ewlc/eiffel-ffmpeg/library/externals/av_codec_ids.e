note
	description: "Different valid options for codec ids"
	copyright: "[
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class AV_CODEC_IDS
	-- enum CODEC_IDs

inherit
	ANY
		undefine copy, is_equal end

feature {} -- Enumeration

	is_valid_av_codec_id (a_codec_id: INTEGER): BOOLEAN is
		do
			Result := a_codec_id.in_range (codec_id_none, codec_id_mpeg2ts)
		end

	codec_id_none: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_NONE"
		end

	codec_id_mpeg1video: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MPEG1VIDEO"
		end

	codec_id_mpeg2video: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MPEG2VIDEO"
		end

	codec_id_mpeg2video_xvmc: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MPEG2VIDEO_XVMC"
		end

	codec_id_h261: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_H261"
		end

	codec_id_h263: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_H263"
		end

	codec_id_rv10: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_RV10"
		end

	codec_id_rv20: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_RV20"
		end

	codec_id_mjpeg: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MJPEG"
		end

	codec_id_mjpegb: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MJPEGB"
		end

	codec_id_ljpeg: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_LJPEG"
		end

	codec_id_sp5x: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SP5X"
		end

	codec_id_jpegls: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_JPEGLS"
		end

	codec_id_mpeg4: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MPEG4"
		end

	codec_id_rawvideo: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_RAWVIDEO"
		end

	codec_id_msmpeg4v1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MSMPEG4V1"
		end

	codec_id_msmpeg4v2: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MSMPEG4V2"
		end

	codec_id_msmpeg4v3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MSMPEG4V3"
		end

	codec_id_wmv1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_WMV1"
		end

	codec_id_wmv2: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_WMV2"
		end

	codec_id_h263p: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_H263P"
		end

	codec_id_h263i: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_H263I"
		end

	codec_id_flv1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_FLV1"
		end

	codec_id_svq1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SVQ1"
		end

	codec_id_svq3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SVQ3"
		end

	codec_id_dvvideo: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_DVVIDEO"
		end

	codec_id_huffyuv: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_HUFFYUV"
		end

	codec_id_cyuv: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_CYUV"
		end

	codec_id_h264: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_H264"
		end

	codec_id_indeo3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_INDEO3"
		end

	codec_id_vp3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_VP3"
		end

	codec_id_theora: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_THEORA"
		end

	codec_id_asv1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ASV1"
		end

	codec_id_asv2: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ASV2"
		end

	codec_id_ffv1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_FFV1"
		end

	codec_id_4xm: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_4XM"
		end

	codec_id_vcr1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_VCR1"
		end

	codec_id_cljr: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_CLJR"
		end

	codec_id_mdec: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MDEC"
		end

	codec_id_roq: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ROQ"
		end

	codec_id_interplay_video: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_INTERPLAY_VIDEO"
		end

	codec_id_xan_wc3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_XAN_WC3"
		end

	codec_id_xan_wc4: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_XAN_WC4"
		end

	codec_id_rpza: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_RPZA"
		end

	codec_id_cinepak: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_CINEPAK"
		end

	codec_id_ws_vqa: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_WS_VQA"
		end

	codec_id_msrle: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MSRLE"
		end

	codec_id_msvideo1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MSVIDEO1"
		end

	codec_id_idcin: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_IDCIN"
		end

	codec_id_8bps: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_8BPS"
		end

	codec_id_smc: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SMC"
		end

	codec_id_flic: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_FLIC"
		end

	codec_id_truemotion1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_TRUEMOTION1"
		end

	codec_id_vmdvideo: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_VMDVIDEO"
		end

	codec_id_mszh: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MSZH"
		end

	codec_id_zlib: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ZLIB"
		end

	codec_id_qtrle: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_QTRLE"
		end

	codec_id_snow: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SNOW"
		end

	codec_id_tscc: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_TSCC"
		end

	codec_id_ulti: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ULTI"
		end

	codec_id_qdraw: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_QDRAW"
		end

	codec_id_vixl: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_VIXL"
		end

	codec_id_qpeg: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_QPEG"
		end

	codec_id_xvid: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_XVID"
		end

	codec_id_png: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PNG"
		end

	codec_id_ppm: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PPM"
		end

	codec_id_pbm: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PBM"
		end

	codec_id_pgm: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PGM"
		end

	codec_id_pgmyuv: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PGMYUV"
		end

	codec_id_pam: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PAM"
		end

	codec_id_ffvhuff: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_FFVHUFF"
		end

	codec_id_rv30: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_RV30"
		end

	codec_id_rv40: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_RV40"
		end

	codec_id_vc9: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_VC9"
		end

	codec_id_wmv3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_WMV3"
		end

	codec_id_loco: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_LOCO"
		end

	codec_id_wnv1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_WNV1"
		end

	codec_id_aasc: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_AASC"
		end

	codec_id_indeo2: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_INDEO2"
		end

	codec_id_fraps: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_FRAPS"
		end

	codec_id_truemotion2: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_TRUEMOTION2"
		end

	codec_id_bmp: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_BMP"
		end

	codec_id_cscd: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_CSCD"
		end

	codec_id_mmvideo: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MMVIDEO"
		end

	codec_id_zmbv: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ZMBV"
		end

	codec_id_avs: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_AVS"
		end

	codec_id_smackvideo: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SMACKVIDEO"
		end

	codec_id_nuv: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_NUV"
		end

	codec_id_kmvc: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_KMVC"
		end

	codec_id_flashsv: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_FLASHSV"
		end

	codec_id_pcm_s16le: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_S16LE"
		end

	codec_id_pcm_s16be: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_S16BE"
		end

	codec_id_pcm_u16le: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_U16LE"
		end

	codec_id_pcm_u16be: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_U16BE"
		end

	codec_id_pcm_s8: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_S8"
		end

	codec_id_pcm_u8: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_U8"
		end

	codec_id_pcm_mulaw: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_MULAW"
		end

	codec_id_pcm_alaw: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_ALAW"
		end

	codec_id_pcm_s32le: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_S32LE"
		end

	codec_id_pcm_s32be: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_S32BE"
		end

	codec_id_pcm_u32le: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_U32LE"
		end

	codec_id_pcm_u32be: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_U32BE"
		end

	codec_id_pcm_s24le: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_S24LE"
		end

	codec_id_pcm_s24be: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_S24BE"
		end

	codec_id_pcm_u24le: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_U24LE"
		end

	codec_id_pcm_u24be: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_U24BE"
		end

	codec_id_pcm_s24daud: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_PCM_S24DAUD"
		end

	codec_id_adpcm_ima_qt: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_IMA_QT"
		end

	codec_id_adpcm_ima_wav: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_IMA_WAV"
		end

	codec_id_adpcm_ima_dk3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_IMA_DK3"
		end

	codec_id_adpcm_ima_dk4: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_IMA_DK4"
		end

	codec_id_adpcm_ima_ws: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_IMA_WS"
		end

	codec_id_adpcm_ima_smjpeg: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_IMA_SMJPEG"
		end

	codec_id_adpcm_ms: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_MS"
		end

	codec_id_adpcm_4xm: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_4XM"
		end

	codec_id_adpcm_xa: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_XA"
		end

	codec_id_adpcm_adx: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_ADX"
		end

	codec_id_adpcm_ea: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_EA"
		end

	codec_id_adpcm_g726: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_G726"
		end

	codec_id_adpcm_ct: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_CT"
		end

	codec_id_adpcm_swf: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_SWF"
		end

	codec_id_adpcm_yamaha: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_YAMAHA"
		end

	codec_id_adpcm_sbpro_4: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_SBPRO_4"
		end

	codec_id_adpcm_sbpro_3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_SBPRO_3"
		end

	codec_id_adpcm_sbpro_2: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ADPCM_SBPRO_2"
		end

	codec_id_amr_nb: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_AMR_NB"
		end

	codec_id_amr_wb: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_AMR_WB"
		end

	codec_id_ra_144: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_RA_144"
		end

	codec_id_ra_288: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_RA_288"
		end

	codec_id_roq_dpcm: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ROQ_DPCM"
		end

	codec_id_interplay_dpcm: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_INTERPLAY_DPCM"
		end

	codec_id_xan_dpcm: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_XAN_DPCM"
		end

	codec_id_sol_dpcm: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SOL_DPCM"
		end

	codec_id_mp2: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MP2"
		end

	codec_id_mp3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MP3"
		end

	codec_id_aac: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_AAC"
		end

	codec_id_mpeg4aac: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MPEG4AAC"
		end

	codec_id_ac3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_AC3"
		end

	codec_id_dts: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_DTS"
		end

	codec_id_vorbis: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_VORBIS"
		end

	codec_id_dvaudio: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_DVAUDIO"
		end

	codec_id_wmav1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_WMAV1"
		end

	codec_id_wmav2: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_WMAV2"
		end

	codec_id_mace3: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MACE3"
		end

	codec_id_mace6: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MACE6"
		end

	codec_id_vmdaudio: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_VMDAUDIO"
		end

	codec_id_sonic: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SONIC"
		end

	codec_id_sonic_ls: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SONIC_LS"
		end

	codec_id_flac: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_FLAC"
		end

	codec_id_mp3adu: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MP3ADU"
		end

	codec_id_mp3on4: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MP3ON4"
		end

	codec_id_shorten: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SHORTEN"
		end

	codec_id_alac: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_ALAC"
		end

	codec_id_westwood_snd1: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_WESTWOOD_SND1"
		end

	codec_id_gsm: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_GSM"
		end

	codec_id_qdm2: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_QDM2"
		end

	codec_id_cook: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_COOK"
		end

	codec_id_truespeech: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_TRUESPEECH"
		end

	codec_id_tta: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_TTA"
		end

	codec_id_smackaudio: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_SMACKAUDIO"
		end

	codec_id_oggtheora: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_OGGTHEORA"
		end

	codec_id_dvd_subtitle: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_DVD_SUBTITLE"
		end

	codec_id_dvb_subtitle: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_DVB_SUBTITLE"
		end

	codec_id_mpeg2ts: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_ID_MPEG2TS"
		end

end -- class AV_CODEC_IDS
