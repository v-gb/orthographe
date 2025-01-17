(** This module allows one to break down the pronunciation of French words into a list
    of (graphem, phonem), and provides an indication of how surprising the pronunciation
    is. *)

type t

val create : unit -> t

type importance =
  | Core_optional
  | Core
  | Surprising

type path_elt =
  { graphem : string
  ; phonem : string
  ; i : int
  ; j : int
  ; this_surprise : int
  ; importance : importance
  }

type search_res =
  { path : path_elt list
  ; surprise : int
  }

val to_string : search_res -> string
val search : t -> string -> string -> (search_res, Sexplib.Sexp.t) Result.t

(** A few utility functions *)

val accent_aigu : string -> bool
(** Given the phonems that follow the phonem for an «e» letter, compute whether e's
    syllable is closed or open, that is, which of é or è you should expect it to be
    pronounced as (although it would probably work the same for other pairs of
    open/closed vowels). *)

val ( #: ) : string -> int * int -> string
val ( #:: ) : string -> int * int -> Uchar.t
val in_ortho_weak_vowels : Uchar.t -> bool
val in_ortho_vowels : Uchar.t -> bool
val str_of_uchar : Uchar.t -> string

(** *)

val a_macron : Uchar.t
val e_macron : Uchar.t
val i_macron : Uchar.t
val o_macron : Uchar.t
val u_macron : Uchar.t
val y_macron : Uchar.t
val a_macron_str : string
val e_macron_str : string
val i_macron_str : string
val o_macron_str : string
val u_macron_str : string
val y_macron_str : string
