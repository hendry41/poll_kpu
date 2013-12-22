#= require active_admin/base
$(document).ready ->
  tmp = window.location.pathname.split("/")[2]

  if tmp is "sub_districts"
  	$(".has_many_add").text "Tambah Desa"
  	$("#page_title").text "Kecamatan"
  else if tmp is "candidates"
  	$(".has_many_add").text "Tambah Putaran"
  	$("#page_title").text "Calon"
  	$($(".breadcrumb a")[1]).text "calon"

  $(".view_link").text "Lihat"
  $(".edit_link").text "Ubah"
  $(".delete_hapus").text "Hapus"
  
  if window.location.pathname.split("/").length == 4
  	$("#titlebar_right a:first").text "Ubah"
  	$("#titlebar_right a:last").text "Hapus"
  else
  	$("#titlebar_right a").text "Tambah"
  

  $(".input_action input").val "Simpan"
  $("#filters_sidebar_section h3").text "Pencarian"
  $("#filters_sidebar_section .buttons input").val "Cari"
  $("#filters_sidebar_section .buttons a").text "Hapus"
  $(".cancel a").text "Batal"