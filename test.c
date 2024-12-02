//
// Created by vva on 11/9/2024.
//


#include "trie.h"


int main() {
    TrieNode *root = create_trie();

    for(int i = 0; i < 10000000; i++) {
        insert(root, "abcd");
        insert(root, "vishal");
        insert(root, "vivek");
        insert(root, "harsha");
    }

    printf("contains: %s\n", contains("visbal", root)? "true": "false");
    printf("contains: %s\n", contains("vishal", root)? "true": "false");
    printf("contains: %s\n", contains("vi", root)? "true": "false");
    printf("contains: %s\n", contains("visha", root)? "true": "false");

    free_trie(root);

    return 0;
}