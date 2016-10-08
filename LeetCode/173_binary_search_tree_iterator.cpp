/**
 * Definition for binary tree
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class BSTIterator {
public:
    std::stack<TreeNode*> pathAbove;
    TreeNode* currentPosition;
    const TreeNode * const finalNode;

    BSTIterator(TreeNode* root) : currentPosition(goToMin(root)), finalNode(findMax(root)){
    }

    /** @return whether we have a next smallest number */
    bool hasNext() {
        return currentPosition != nullptr;
    }

    /** @return the next smallest number */
    int next() {
      int current = currentPosition->val;
      
      if(currentPosition == finalNode){
          currentPosition = nullptr;
          return current;
      }
      
      if(currentPosition->right != nullptr){
          currentPosition = goToMin(currentPosition->right);
      } else {
          //As you can go up left continue going.
          while(!pathAbove.empty() and pathAbove.top()->right == currentPosition){
              currentPosition = pathAbove.top();
              pathAbove.pop();
          }
          
          //Go up right for the first time.
          currentPosition = pathAbove.top();
          pathAbove.pop();
      }
      
      return current;
    }
    
private:
    TreeNode* goToMin(TreeNode* currentRoot){
        if(currentRoot == nullptr){
            return currentRoot;
        }
        
        while(currentRoot->left != nullptr){
            pathAbove.push(currentRoot);
            currentRoot = currentRoot->left;
        }
        
        return currentRoot;
    }
    
    static TreeNode* findMax(TreeNode* currentRoot){
        if(currentRoot == nullptr){
            return currentRoot;
        }
        
        while(currentRoot->right != nullptr){
            currentRoot = currentRoot->right;
        }
        
        return currentRoot;
    }
};

/**
 * Your BSTIterator will be called like this:
 * BSTIterator i = BSTIterator(root);
 * while (i.hasNext()) cout << i.next();
 */