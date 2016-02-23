//
//  TreeNode.h
//  TestTree
//
//  Created by victor zhang on 2/4/16.
//  Copyright © 2016 victor zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

@property (nonatomic, assign) int val;
@property (nonatomic, strong) TreeNode *left;
@property (nonatomic, strong) TreeNode *right;
@property (nonatomic, strong) TreeNode *next;

- (instancetype)initWithValue:(int)val;

- (void)inorderTraversalWithArray:(NSMutableArray<TreeNode *>*)resultArray withRootNode:(TreeNode *)root;

- (void)preorderTraversalWithArray:(NSMutableArray<TreeNode *>*)resultArray withRootNode:(TreeNode *)root;

- (void)postorderTraversalWithArray:(NSMutableArray<TreeNode *>*)resultArray withRootNode:(TreeNode *)root;

//level order traversal
- (void)levelorderTraversalWithArray:(NSMutableArray<TreeNode *>*)resultArray withRootNode:(TreeNode *)root;

//populate next node in tree
- (TreeNode *)populateNextNodeInTree:(TreeNode *)root;


@end
