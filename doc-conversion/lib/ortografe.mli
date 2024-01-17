type 'a out =
  | Channel : Out_channel.t -> unit out
  | String : string out

val erofa : (string, string) Hashtbl.t Lazy.t
val rect1990 : (string, string) Hashtbl.t Lazy.t
type options =
  { convert_uppercase : bool
  ; dict : (string, string) Hashtbl.t
  }

val pure_text : ?buf:Buffer.t -> options:options -> string -> dst:'a out -> 'a
val html : ?buf:Buffer.t -> ?debug:bool -> ?pp:bool -> options:options -> string -> dst:'a out -> 'a
val htmlz : ?buf:Buffer.t -> ?debug:bool -> ?pp:bool -> options:options -> string -> dst:'a out -> 'a
val docx : ?buf:Buffer.t -> ?debug:bool -> ?pp:bool -> options:options -> string -> dst:'a out -> 'a
val epub : ?buf:Buffer.t -> ?debug:bool -> ?pp:bool -> options:options -> string -> dst:'a out -> 'a
val doc : ?buf:Buffer.t -> ?debug:bool -> ?pp:bool -> options:options -> string -> dst:'a out -> 'a
val max_size : int ref

val convert_string : ext:string -> options:options -> string -> (string * string) option
val convert_files : options:options -> string option -> string option -> unit

val map_zip
    : string
      -> (Zipc.Member.t -> Zipc.File.t -> (unit -> string) -> string option)
      -> string

(**/**)
module Private : sig
  val docx_document : string -> string
  val read_whole_zip : string -> string
end
