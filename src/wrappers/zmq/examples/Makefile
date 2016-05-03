example: server client
#	./server &
#	./client

client: zmq_example_client.e
	compile zmq_example_client -o client -split by_type

server: zmq_example_server.e
	compile zmq_example_server -o server -split by_type

clean:
	rm client server
	clean zmq_example_client
	clean zmq_example_server

