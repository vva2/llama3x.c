//
// Created by vva on 11/9/2024.
//


#include "trie.h"


int main() {
    TrieNode *root = create_trie();

    for(int i = 0; i < 1; i++) {
//        insert(root, "abcd", 0);
        insert(root, "vishal", 100);
//        insert(root, "vivek", 2);
//        insert(root, "harsha", 3);
    }

    printf("contains: %s | key : %s | value: %d\n", contains("vishal", root)? "true": "false", "vishal", trie_search(root, "vishal"));
//    printf("contains: %s | key : %s | value: %d\n", contains("vishal", root)? "true": "false", "vishal", trie_search(root, "vishal"));
//    printf("contains: %s | key : %s | value: %d\n", contains("vi", root)? "true": "false", "vi", trie_search(root, "vi"));
//    printf("contains: %s | key : %s | value: %d\n", contains("visha", root)? "true": "false", "visha", trie_search(root, "visha"));

    free_trie(root);

    return 0;
}