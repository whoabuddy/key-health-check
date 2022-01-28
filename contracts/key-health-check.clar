;; key-health-check
;; simple contract to allow an address to check-in at a block height

(define-constant ERR_USER_NOT_FOUND u1000)

(define-map HealthCheck
  principal
  uint
)

(define-read-only (last-checked (user principal))
  (ok (unwrap! (map-get? HealthCheck user) (err ERR_USER_NOT_FOUND)))
)

(define-public (check-in)
  (ok (map-set HealthCheck contract-caller block-height))
)
