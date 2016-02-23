//
//  TreeNode.m
//  TestTree
//
//  Created by victor zhang on 2/4/16.
//  Copyright © 2016 victor zhang. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode


- (instancetype)initWithValue:(int)val {
    if (self = [super init]) {
        self.val = val;
        self.left = nil;
        self.right = nil;
        self.next = nil;
    }
    return self;
}

- (void)inorderTraversalWithArray:(NSMutableArray<TreeNode *>*)resultArray withRootNode:(TreeNode *)root {
    if (root == nil) {
        return;
    }
    [self inorderTraversalWithArray:resultArray withRootNode:root.left];
    [resultArray addObject:root];
    [self inorderTraversalWithArray:resultArray withRootNode:root.right];
    return;
}

- (void)preorderTraversalWithArray:(NSMutableArray<TreeNode *>*)resultArray withRootNode:(TreeNode *)root {
    if (root == nil) {
        return;
    }
    [resultArray addObject:root];
    [self preorderTraversalWithArray:resultArray withRootNode:root.left];
    [self preorderTraversalWithArray:resultArray withRootNode:root.right];
    return;
}

- (void)postorderTraversalWithArray:(NSMutableArray<TreeNode *>*)resultArray withRootNode:(TreeNode *)root {
    if (root == nil) {
        return;
    }
    [self postorderTraversalWithArray:resultArray withRootNode:root.left];
    [self postorderTraversalWithArray:resultArray withRootNode:root.right];
    [resultArray addObject:root];
    return;
}

- (void)levelorderTraversalWithArray:(NSMutableArray<TreeNode *>*)resultArray withRootNode:(TreeNode *)root {
    //BFS
    NSMutableArray *primaryArray = [[NSMutableArray alloc] initWithCapacity:100];
    [primaryArray addObject:root];
    while (primaryArray.count > 0) {
        [resultArray addObjectsFromArray:primaryArray];
        NSMutableArray *secondaryArray = [[NSMutableArray alloc] initWithCapacity:50];
        for (TreeNode *node in primaryArray) {
            if (node.left) {
                [secondaryArray addObject:node.left];
            }
            if (node.right) {
                [secondaryArray addObject:node.right];
            }
        }
        primaryArray = [secondaryArray mutableCopy];
    }
    return;
}

- (TreeNode *)populateNextNodeInTree:(TreeNode *)root {
    if (!root) {
        return root;
    }
    root.next = nil;
    TreeNode *rsRoot = root;
    TreeNode *curHead = root;
    TreeNode *curHeadCur = nil;
    while (curHead) {
        curHeadCur = curHead;
        TreeNode *nextHead = nil;
        TreeNode *nextHeadCur = nil;
        //single level traversal
        while (curHeadCur) {
            if (curHeadCur.left) {
                if (!nextHead) {
                    nextHead = curHeadCur.left;
                    nextHeadCur = nextHead;
                }
                else {
                    nextHeadCur.next = curHeadCur.left;
                    nextHeadCur = nextHeadCur.next;
                }
            }
            if (curHeadCur.right) {
                if (!nextHead) {
                    nextHead = curHeadCur.right;
                    nextHeadCur = nextHead;
                }
                else {
                    nextHeadCur.next = curHeadCur.right;
                    nextHeadCur = nextHeadCur.next;
                }
            }
            curHeadCur = curHeadCur.next;
        }
        curHead = nextHead;
    }
    return rsRoot;
}


@end
