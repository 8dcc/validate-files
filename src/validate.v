import os
import crypto.sha1

fn main() {
	mut file_paths := []string{len: 2}
	read_from_files := true
	short_answer := false

	// Read from arguments
	if os.args.len > 2 {
		// Read from files
		if read_from_files {
			file_paths[0] = os.args[1]
			file_paths[1] = os.args[2]
		} //...(Ask or detect sha1 hashes)
	} else {
		// Ask user for input
		panic('need arguments. input not ready yet')
	}

	file0 := os.read_file(file_paths[0]) or { panic('error reading file ${file_paths[0]}') }
	file1 := os.read_file(file_paths[1]) or { panic('error reading file ${file_paths[1]}') }
	file0h := sha1.hexhash(file0)
	file1h := sha1.hexhash(file1)

	// They match
	if file0h == file1h {
		if short_answer {
			println("Hashes match for file ${file_paths[0]} and ${file_paths[1]}:")
			println(file0h)
			return
		} else {
			println("OK: $file0h")	// Add colors and symbols all that
			return
		}
	// Do not match
	} else {
		if short_answer {
			println("Hashes do not match.")
			println("${file_paths[0]} - $file0h")
			println("${file_paths[1]} - $file1h")
			return
		} else {
			println("WRONG: $file0h - $file1h")
			return
		}
	}
}
