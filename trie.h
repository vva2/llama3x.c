//
// Created by vva on 12/1/2024.
//

#ifndef LLAMA3X_TRIE_H
#define LLAMA3X_TRIE_H

#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>

typedef struct TrieNode {
    char c;
    struct TrieNode *children;
    struct TrieNode *next;
    int id;
} TrieNode;

TrieNode* find_child(TrieNode* node, char c) {
    if(node != NULL && node->children != NULL) {
        TrieNode *ptr = node->children;

        while(ptr != NULL && ptr->c != c) {
            ptr = ptr->next;
        }

        return ptr;
    }

    return NULL;
}

void insert_child(TrieNode* node, TrieNode* child) {
    child->next = node->children;
    node->children = child;
}

TrieNode* new_node(char c) {
    TrieNode *node = (TrieNode*) malloc(sizeof(TrieNode));
    node->c = c;
    node->children = NULL;
    node->next = NULL;
    node->id = -1;

    return node;
}

TrieNode* create_trie() {
    return new_node('$');
}

void insert(TrieNode* node, char* key, int id) {
    int len = strlen(key);

    TrieNode* ptr = node;
    for(int i = 0; i < len; i++) {
        char c = key[i];

        TrieNode* child = find_child(ptr, c);

        if(child == NULL) {
            child = new_node(c);
            insert_child(ptr, child);
        }

        ptr = child;
    }

    ptr->id = id;
}

int trie_search(TrieNode *trie, char *str) {
    TrieNode* ptr = trie;
    int len = strlen(str);
    int i;

    for(i = 0; i < len && ptr != NULL; i++) {
        ptr = find_child(ptr, str[i]);
    }

    if(i == len && ptr != NULL)
        return ptr->id;

    return -1;
}

bool contains(char* str, TrieNode* root) {
    return trie_search(root, str) != -1;
}

void free_trie(TrieNode* root) {
    if(root == NULL)
        return;

    TrieNode* ptr = root->children;

    while(ptr != NULL) {
        TrieNode* next = ptr->next;
        free_trie(ptr);
        ptr = next;
    }

    if(ptr != NULL)
        free(ptr);
}

#endif //LLAMA3X_TRIE_H
