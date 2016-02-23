//
//  main.m
//  TestTree
//
//  Created by victor zhang on 2/4/16.
//  Copyright © 2016 victor zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        TreeNode *root = [[TreeNode alloc] initWithValue:3];
        TreeNode *node1 = [[TreeNode alloc] initWithValue:9];
        TreeNode *node2 = [[TreeNode alloc] initWithValue:20];
        TreeNode *node3 = [[TreeNode alloc] initWithValue:15];
        TreeNode *node4 = [[TreeNode alloc] initWithValue:7];
        
        root.left = node1;
        root.right = node2;
        
        node2.left = node3;
        node2.right = node4;
        
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:100];
//        [root inorderTraversalWithArray:arr withRootNode:root];
//        [root preorderTraversalWithArray:arr withRootNode:root];
//        [root postorderTraversalWithArray:arr withRootNode:root];
//        [root levelorderTraversalWithArray:arr withRootNode:root];
        TreeNode *newRoot = [root populateNextNodeInTree:root];
        [newRoot levelorderTraversalWithArray:arr withRootNode:newRoot];
        for (TreeNode *node in arr) {
            NSLog(@"%d", node.val);
        }
        
    }
    return 0;
}
