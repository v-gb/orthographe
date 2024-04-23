(** OfficeOpenXML is Microsoft's format for the office suite (Word, PowerPoint, etc)
    since 2007 or so. Not to be confused with OpenDocument, the format used by the
    equivalent open source tools. *)

val convert_xml : [< `Docx | `Pptx ] -> _ Common.convert
val convert : [< `Docx | `Pptx ] -> _ Common.convert
val convert_old : [< `Doc | `Ppt ] -> _ Common.convert
