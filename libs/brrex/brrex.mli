val throw : Jv.Error.t -> _
val or_throw : ('a, Jv.Error.t) result -> 'a
val is_array : Jv.t -> bool

(** These three functions are better versions of the same names in Fut. The problem with
   Fut is that it fails to forward rejected promises, which breaks the propagation
   of exceptions, and prevents exception handling like error reporting and cleanup. *)
val fut_to_promise : ok:('a -> Jv.t) -> 'a Fut.or_error -> Jv.Promise.t
val fut_to_promise' : ok:('a -> Jv.t) -> error:('b -> Jv.t) -> ('a, 'b) Fut.result -> Jv.Promise.t
val fut_await : 'a Fut.t -> (('a, Jv.Error.t) result -> unit) -> unit

val json_of_string : string -> ([> `Array of 'a list
                                | `Assoc of (string * 'a) list
                                | `Bool of bool
                                | `Null
                                | `Number of float
                                | `String of string ]
                                as 'a)
val json_to_string : ([< `Array of 'a list
                      | `Assoc of (string * 'a) list
                      | `Bool of bool
                      | `Null
                      | `Number of float
                      | `String of string ]
                      as 'a) -> string

val read_bytes : Brr.File.t -> string Fut.or_error
