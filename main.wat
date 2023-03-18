(module
  (func $fizzbuzz (param $n i32) (result i32)
        ;; divisible by 3 and 5.
        local.get $n        
        i32.const 3 
        i32.rem_s
        i32.const 0
        i32.eq 
        if
            local.get $n
            i32.const 5
            i32.rem_s
            i32.const 0
            i32.eq
            if
                i32.const 15 
                return
            end
        end

        ;; divisible by 3
        local.get $n
        i32.const 3
        i32.rem_s
        i32.const 0
        i32.eq
        if
            i32.const 3
            return
        end

        ;; divisible by 5
        local.get $n
        i32.const 5
        i32.rem_s
        i32.const 0
        i32.eq
        if
            i32.const 5
            return
        end


        local.get $n 
    )
  (export "fizzbuzz" (func $fizzbuzz))
 )
