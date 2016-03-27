class VARIANT_USAGE
    -- How to use VARIANT and its typed hiers

create {ANY} make

feature  {ANY}
    make 
        do
            collection.add_last(create {TYPED_VARIANT[STRING]}.set_item("foobar"))
            collection.add_last(create {TYPED_VARIANT[INTEGER]}.set_item(38))
            collection.add_last(create {TYPED_VARIANT[REAL]}.set_item(3.14))
            collection.add_last(create {TYPED_VARIANT[STRING]}.set_item(Void))
            collection.for_each (agent (x: VARIANT) do print("Got "+x.out+"%N") end(?))
        end


    collection: COLLECTION[VARIANT] 
        once 
            create {LINKED_LIST[VARIANT]} Result
        end
end 
